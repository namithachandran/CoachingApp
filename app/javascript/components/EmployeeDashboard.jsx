import React, { useState, useEffect } from 'react';
import axios from 'axios';

const EmployeeDashboard = ({ employeeId }) => {
  const [programs, setPrograms] = useState([]);
  const [joiningProgramId, setJoiningProgramId] = useState(null);
  const [successMessage, setSuccessMessage] = useState(''); 

  // Fetch coaching programs assigned to the employee
  useEffect(() => {
    axios.get(`/api/v1/employees/${employeeId}/programs_with_coaches`)
      .then(response => setPrograms(response.data))
      .catch(error => console.error('Error fetching programs:', error));
  }, [employeeId]);

  const handleJoinProgram = (programId) => {
    setJoiningProgramId(programId);
    setSuccessMessage(''); 
    axios.post(`/api/v1/coaching_programs/${programId}/join`, { employee_id: employeeId })
      .then(response => {
        console.log('Joined program successfully:', response.data);
        setSuccessMessage('Successfully joined the program!');
        setJoiningProgramId(null);  
      })
      .catch(error => {
        console.error('Error joining program:', error);
        setJoiningProgramId(null); 
      });
  };

  return (
    <div style={{ padding: '20px', textAlign: 'center' }}>
      <h1>Available Coaching Programs</h1>
      {successMessage && ( 
        <div style={{ margin: '20px 0', color: 'green', fontWeight: 'bold' }}>
          {successMessage}
        </div>
      )}
      {programs.length === 0 ? (
        <p>No coaching programs available.</p>
      ) : (
        <table style={{ width: '100%', borderCollapse: 'collapse' }}>
          <thead>
            <tr>
              <th style={{ border: '1px solid #ddd', padding: '10px', textAlign: 'center' }}>Program Title</th>
              <th style={{ border: '1px solid #ddd', padding: '10px', textAlign: 'center' }}>Coaches</th>
              <th style={{ border: '1px solid #ddd', padding: '10px', textAlign: 'center' }}>Action</th>
            </tr>
          </thead>
          <tbody>
            {programs.map(program => (
              <tr key={program.id} style={{ borderBottom: '1px solid #ddd' }}>
                <td style={{ border: '1px solid #ddd', padding: '10px' }}>{program.title}</td>
                <td style={{ border: '1px solid #ddd', padding: '10px' }}>
                  <ul style={{ padding: 0, margin: 0, listStyleType: 'none' }}>
                    {program.coaches.map(coach => (
                      <li key={coach.id}>{coach.name}</li>
                    ))}
                  </ul>
                </td>
                <td style={{ border: '1px solid #ddd', padding: '10px' }}>
                  <button
                    onClick={() => handleJoinProgram(program.id)}
                    disabled={joiningProgramId === program.id}
                    style={{
                      padding: '10px 20px',
                      backgroundColor: joiningProgramId === program.id ? '#ccc' : '#4CAF50',
                      color: 'white',
                      border: 'none',
                      borderRadius: '5px',
                      cursor: joiningProgramId === program.id ? 'not-allowed' : 'pointer',
                      transition: 'background-color 0.3s'
                    }}
                  >
                    {joiningProgramId === program.id ? 'Joining...' : 'Join Program'}
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default EmployeeDashboard;
