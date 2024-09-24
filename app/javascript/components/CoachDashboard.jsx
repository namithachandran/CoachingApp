import React, { useState, useEffect } from 'react';
import axios from 'axios';

const CoachDashboard = ({ coachId }) => {
  const [programs, setPrograms] = useState([]);

  useEffect(() => {
    // Fetch coaching programs for the coach
    axios.get(`/api/v1/coaches/${coachId}/dashboard`)
      .then(response => setPrograms(response.data))
      .catch(error => console.error('Error fetching programs:', error));
  }, [coachId]);

  return (
    <div>
      <h1>Coaching Programs</h1>
      <ul>
        {programs.map(program => (
          <li key={program.id}>
            {program.title} - Enrolled Employees: {program.employees.length}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default CoachDashboard;
