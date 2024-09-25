import React, { useState, useEffect } from 'react';
import axios from 'axios';

const CompanyLandingPage = ({ companyId }) => {
  const [company, setCompany] = useState(null);
  const [employeeName, setEmployeeName] = useState('');
  const [employeeEmail, setEmployeeEmail] = useState('');
  const [employeePassword, setEmployeePassword] = useState(''); 
  const [employeePasswordConfirmation, setEmployeePasswordConfirmation] = useState(''); 
  const [isRegistrationVisible, setIsRegistrationVisible] = useState(false); 
  const [areProgramsVisible, setAreProgramsVisible] = useState(false); 
  const [successMessage, setSuccessMessage] = useState(''); 

  useEffect(() => {
    axios.get(`/api/v1/companies/${companyId}`)
      .then(response => setCompany(response.data))
      .catch(error => console.error('Error fetching company details:', error));
  }, [companyId]);

  const handleEmployeeSubmit = (e) => {
    e.preventDefault();
    
    axios.post(`/api/v1/companies/${companyId}/employees`, {
      name: employeeName,
      email: employeeEmail,
      password: employeePassword,
      password_confirmation: employeePasswordConfirmation
    })
    .then(response => {
      console.log('Employee registered:', response.data);
      setSuccessMessage('Successfully registered!');
      setEmployeeName('');
      setEmployeeEmail('');
      setEmployeePassword('');
      setEmployeePasswordConfirmation('');
    })
    .catch(error => {
      console.error('Error registering employee:', error);
      setSuccessMessage('Error registering employee.'); 
    });
  };

  if (!company) {
    return <div style={{ textAlign: 'center', padding: '20px' }}>Loading...</div>;
  }

  return (
    <div style={{ padding: '20px', maxWidth: '600px', margin: '0 auto', textAlign: 'center' }}>
      <h1>Welcome to {company.name}..!!!</h1> 

      {/* Button to show assigned coaching programs */}
      <button 
        onClick={() => setAreProgramsVisible(!areProgramsVisible)} 
        style={{
          margin: '20px 0',
          padding: '10px 20px',
          backgroundColor: areProgramsVisible ? '#f44336' : '#4CAF50',
          color: 'white',
          border: 'none',
          borderRadius: '5px',
          cursor: 'pointer',
          transition: 'background-color 0.3s'
        }}
      >
        {areProgramsVisible ? 'Hide Assigned Coaching Programs' : 'Show Assigned Coaching Programs'}
      </button> <br />

      {areProgramsVisible && ( 
        <div>
          <h2>
            <ul style={{ listStyleType: 'none', padding: 0 }}>
              {company.coaching_programs.map(program => (
                <li key={program.id} style={{ margin: '10px 0' }}>
                  <span style={{ fontWeight: 'bold' }}>{program.title}</span>
                </li>
              ))}
            </ul>
          </h2>
        </div>
      )}

      <button 
        onClick={() => setIsRegistrationVisible(!isRegistrationVisible)} 
        style={{
          margin: '20px 0',
          padding: '10px 20px',
          backgroundColor: isRegistrationVisible ? '#f44336' : '#4CAF50',
          color: 'white',
          border: 'none',
          borderRadius: '5px',
          cursor: 'pointer',
          transition: 'background-color 0.3s'
        }}
      >
        {isRegistrationVisible ? 'Hide Registration Form' : 'Employee Registration'}
      </button>

      {isRegistrationVisible && ( 
        <div style={{ border: '1px solid #ddd', borderRadius: '5px', padding: '20px', marginTop: '20px' }}>
          <h3>Employee Registration Form</h3>
          <form onSubmit={handleEmployeeSubmit}>
            <div>
              <label>Name:</label>
              <input
                type="text"
                value={employeeName}
                onChange={(e) => setEmployeeName(e.target.value)}
                required
                style={{ width: '100%', padding: '10px', margin: '10px 0', borderRadius: '5px', border: '1px solid #ddd' }}
              />
            </div>
            <div>
              <label>Email:</label>
              <input
                type="email"
                value={employeeEmail}
                onChange={(e) => setEmployeeEmail(e.target.value)}
                required
                style={{ width: '100%', padding: '10px', margin: '10px 0', borderRadius: '5px', border: '1px solid #ddd' }}
              />
            </div>
            <div>
              <label>Password:</label>
              <input
                type="password"
                value={employeePassword}
                onChange={(e) => setEmployeePassword(e.target.value)}
                required
                style={{ width: '100%', padding: '10px', margin: '10px 0', borderRadius: '5px', border: '1px solid #ddd' }}
              />
            </div>
            <div>
              <label>Confirm Password:</label>
              <input
                type="password"
                value={employeePasswordConfirmation}
                onChange={(e) => setEmployeePasswordConfirmation(e.target.value)}
                required
                style={{ width: '100%', padding: '10px', margin: '10px 0', borderRadius: '5px', border: '1px solid #ddd' }}
              />
            </div>
            <button 
              type="submit"
              style={{
                padding: '10px 20px',
                backgroundColor: '#4CAF50',
                color: 'white',
                border: 'none',
                borderRadius: '5px',
                cursor: 'pointer',
                transition: 'background-color 0.3s'
              }}
            >
              Register
            </button>
          </form>
        </div>
      )}

      {successMessage && ( 
        <div style={{ marginTop: '20px', color: 'green', fontWeight: 'bold' }}>
          {successMessage}
        </div>
      )}
    </div>
  );
};

export default CompanyLandingPage;
