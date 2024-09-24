import React, { useState, useEffect } from 'react';
import axios from 'axios';

const EmployeeDashboard = ({ employeeId }) => {
  const [programs, setPrograms] = useState([]);
  const [joiningProgramId, setJoiningProgramId] = useState(null);

  // Fetch coaching programs assigned to the employee
  useEffect(() => {
    axios.get(`/api/v1/employees/${employeeId}/programs_with_coaches`)
      .then(response => setPrograms(response.data))
      .catch(error => console.error('Error fetching programs:', error));
  }, [employeeId]);

  // Handle the request to join a program
  const handleJoinProgram = (programId) => {
    setJoiningProgramId(programId);
    
    axios.post(`/api/v1/coaching_programs/${programId}/join`, { employee_id: employeeId })
      .then(response => {
        console.log('Joined program successfully:', response.data);
        setJoiningProgramId(null);  // Reset after success
      })
      .catch(error => {
        console.error('Error joining program:', error);
        setJoiningProgramId(null);  // Reset in case of error
      });
  };

  return (
    <div style={{ textAlign: 'center' }}>
      <h1>Available Coaching Programs</h1>
      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {programs.length === 0 ? (
          <p>No coaching programs available.</p>
        ) : (
          programs.map(program => (
            <li key={program.id} style={{ margin: '20px 0' }}>
              <h3>{program.title}</h3>
              <p><strong>Coaches:</strong></p>
              <ul>
                {program.coaches.map(coach => (
                  <li key={coach.id}>{coach.name}</li>
                ))}
              </ul>
              <button
                onClick={() => handleJoinProgram(program.id)}
                disabled={joiningProgramId === program.id}  // Disable button if already joining
              >
                {joiningProgramId === program.id ? 'Joining...' : 'Join Program'}
              </button>
            </li>
          ))
        )}
      </ul>
    </div>
  );
};

export default EmployeeDashboard;
