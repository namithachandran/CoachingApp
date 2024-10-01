import React, { useState, useEffect } from 'react';
import axios from 'axios';

const CoachDashboardPage = ({ coachId }) => {
  const [programs, setPrograms] = useState([]);

  useEffect(() => {
    // Fetch coaching programs for the coach
    axios.get(`/api/v1/coaches/${coachId}/dashboard`)
      .then(response => setPrograms(response.data))
      .catch(error => console.error('Error fetching programs:', error));
  }, [coachId]);

  const handleLogout = () => {
    localStorage.removeItem('authToken');

    window.location.href = '/coaches/sign_in'; 
  };

  return (
    <div>
      <h1 style={{ textAlign: 'center' }} >Coaching Programs</h1>
      
      {programs.length === 0 ? (
        <p>No coaching programs available.</p>
      ) : (
        <table border="1" cellPadding="10" style={{ width: '100%', textAlign: 'center' }}>
          <thead >
            <tr>
              <th style={{  textAlign: 'center' }}>Program Title</th>
              <th style={{  textAlign: 'center' }}>Number of Enrolled Employees</th>
            </tr>
          </thead>
          <tbody>
            {programs.map(program => (
              <tr key={program.id}>
                <td>{program.title}</td>
                <td>{program.employees_count}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
      <button onClick={handleLogout} style={{ marginTop: '20px', padding: '10px 20px', backgroundColor: '#f44336', color: 'white', border: 'none', borderRadius: '5px', cursor: 'pointer' }}>
        Logout
      </button>
    </div>
  );
};

export default CoachDashboardPage;
