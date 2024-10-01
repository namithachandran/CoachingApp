import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../src/assets/styles/emloyee_dashboard.scss';
const EmployeeDashboard = ({ employeeId }) => {
  const [programs, setPrograms] = useState([]);
  const [joiningProgramId, setJoiningProgramId] = useState(null);
  const [successMessage, setSuccessMessage] = useState('');
  const [joinedProgramIds, setJoinedProgramIds] = useState(new Set()); // New state to track joined programs

  // Fetch coaching programs assigned to the employee
  useEffect(() => {
    axios.get(`/api/v1/employees/${employeeId}/programs_with_coaches`)
      .then(response => {
        setPrograms(response.data);
        // Initialize the set of joined program IDs
        const joinedIds = new Set(response.data.filter(program => program.is_joined).map(program => program.id));
        setJoinedProgramIds(joinedIds);
      })
      .catch(error => console.error('Error fetching programs:', error));
  }, [employeeId]);

  // Handle the request to join a program
  const handleJoinProgram = (programId) => {
    if (joinedProgramIds.has(programId)) {
      setSuccessMessage('Already joined this program!'); // Show message if already joined
      return; // Exit the function
    }

    setJoiningProgramId(programId);
    setSuccessMessage(''); // Reset success message

    axios.post(`/api/v1/coaching_programs/${programId}/join`, { employee_id: employeeId })
      .then(response => {
        console.log('Joined program successfully:', response.data);
        setSuccessMessage('Successfully joined the program!'); // Set success message
        setJoiningProgramId(null);  // Reset after success
        setJoinedProgramIds(new Set(joinedProgramIds).add(programId)); // Update joined programs
      })
      .catch(error => {
        console.error('Error joining program:', error);
        setJoiningProgramId(null);  // Reset in case of error
      });
  };

  const handleLogout = () => {
    localStorage.removeItem('authToken');
    window.location.href = '/employees/sign_in'; 
  };

  return (
    <div className="dashboard-container">
      <h1>Available Coaching Programs</h1>
      {successMessage && (
        <div className="success-message">
          {successMessage}
        </div>
      )}
      {programs.length === 0 ? (
        <p>No coaching programs available.</p>
      ) : (
        <table className="program-table">
          <thead>
            <tr>
              <th>Program Title</th>
              <th>Coaches</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {programs.map(program => (
              <tr key={program.id}>
                <td>{program.title}</td>
                <td>
                  <ul style={{ padding: 0, margin: 0, listStyleType: 'none' }}>
                    {program.coaches.map(coach => (
                      <li key={coach.id}>{coach.name}</li>
                    ))}
                  </ul>
                </td>
                <td>
                  <button
                    onClick={() => handleJoinProgram(program.id)}
                    disabled={joiningProgramId === program.id}
                    className="join-button"
                  >
                    {joiningProgramId === program.id ? 'Joining...' : (joinedProgramIds.has(program.id) ? 'Already Joined' : 'Join Program')}
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
      <button onClick={handleLogout} className="logout-button">
        Logout
      </button>
    </div>
  );
};

export default EmployeeDashboard;
