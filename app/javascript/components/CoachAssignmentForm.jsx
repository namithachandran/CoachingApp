import React, { useState, useEffect } from 'react';
import axios from 'axios';

const CoachAssignmentForm = ({ coachingProgramId }) => {
  const [coaches, setCoaches] = useState([]);
  const [selectedCoach, setSelectedCoach] = useState('');

  useEffect(() => {
    // Fetch the list of coaches from the server
    axios.get('/api/v1/coaches')
      .then(response => setCoaches(response.data))
      .catch(error => console.error('Error fetching coaches:', error));
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();

    axios.post(`/api/v1/coaching_programs/${coachingProgramId}/coach_assignments`, {
      coach_assignment: { coach_id: selectedCoach }
    })
    .then(response => {
      alert(response.data.message);
    })
    .catch(error => {
      console.error('Error assigning coach:', error);
    });
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label>Select Coach:</label>
        <select value={selectedCoach} onChange={(e) => setSelectedCoach(e.target.value)}>
          <option value="">Select a coach</option>
          {coaches.map(coach => (
            <option key={coach.id} value={coach.id}>
              {coach.name}
            </option>
          ))}
        </select>
      </div>
      <button type="submit">Assign Coach</button>
    </form>
  );
};

export default CoachAssignmentForm;
