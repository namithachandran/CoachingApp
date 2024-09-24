import React, { useState, useEffect } from 'react';
import axios from 'axios';

const CompanyLandingPage = ({ companyId }) => {
  const [company, setCompany] = useState(null);
  const [employeeName, setEmployeeName] = useState('');
  const [employeeEmail, setEmployeeEmail] = useState('');
  const [employeePassword, setEmployeePassword] = useState(''); // State for password
  const [employeePasswordConfirmation, setEmployeePasswordConfirmation] = useState(''); // State for password confirmation
  const [isRegistrationVisible, setIsRegistrationVisible] = useState(false); // State to control registration form visibility

  useEffect(() => {
    // Fetch company data including its coaching programs
    axios.get(`/api/v1/companies/${companyId}`)
      .then(response => setCompany(response.data))
      .catch(error => console.error('Error fetching company details:', error));
  }, [companyId]);

  const handleEmployeeSubmit = (e) => {
    e.preventDefault();
    
    // Make a request to register the employee (you'll need an API for this)
    axios.post(`/api/v1/companies/${companyId}/employees`, {
      name: employeeName,
      email: employeeEmail,
      password: employeePassword,
      password_confirmation: employeePasswordConfirmation // Include password confirmation
    })
    .then(response => {
      console.log('Employee registered:', response.data);
      setEmployeeName('');
      setEmployeeEmail('');
      setEmployeePassword(''); // Clear password field
      setEmployeePasswordConfirmation(''); // Clear confirmation field
    })
    .catch(error => {
      console.error('Error registering employee:', error);
    });
  };

  if (!company) {
    return <div>Loading...</div>;
  }

  return (
    <div style={{ textAlign: 'center' }}>
      <h1>Welcome to {company.name}</h1> {/* Welcome message */}
      
      <h2>Assigned Coaching Programs</h2>
      <ul>
        {company.coaching_programs.map(program => (
          <li key={program.id}>{program.title}</li>
        ))}
      </ul>

      {/* Button to show registration form */}
      <button onClick={() => setIsRegistrationVisible(!isRegistrationVisible)}>
        {isRegistrationVisible ? 'Hide Registration Form' : 'Register as an Employee'}
      </button>

      {isRegistrationVisible && ( // Conditional rendering for the registration form
        <div>
          <h3>Employee Registration</h3>
          <form onSubmit={handleEmployeeSubmit}>
            <div>
              <label>Name:</label>
              <input
                type="text"
                value={employeeName}
                onChange={(e) => setEmployeeName(e.target.value)}
                required
              />
            </div>
            <br />
            <div>
              <label>Email:</label>
              <input
                type="email"
                value={employeeEmail}
                onChange={(e) => setEmployeeEmail(e.target.value)}
                required
              />
            </div>
            <br />
            <div>
              <label>Password:</label>
              <input
                type="password"
                value={employeePassword}
                onChange={(e) => setEmployeePassword(e.target.value)}
                required
              />
            </div>
            <br />
            <div>
              <label>Confirm Password:</label>
              <input
                type="password"
                value={employeePasswordConfirmation}
                onChange={(e) => setEmployeePasswordConfirmation(e.target.value)}
                required
              />
            </div>
            <br />
            <button type="submit">Register</button>
          </form>
        </div>
      )}
    </div>
  );
};

export default CompanyLandingPage;
