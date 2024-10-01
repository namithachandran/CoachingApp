import React, { useState, useEffect } from 'react';
import axios from 'axios';
import backgroundImage from '../src/assets/yellow.jpg';
import '../src/assets/styles/CompanyLandingPage.scss'; 

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

  const handleBackToCompanies = () => {
    window.location.href = '/admin/companies';  // Navigate to the /admin/companies route
  };

  if (!company) {
    return <div style={{ textAlign: 'center', padding: '20px' }}>Loading...</div>;
  }

  return (
    <div className="container">
      <div className="background" style={{ backgroundImage: `url(${backgroundImage})` }}>
        <h1>Welcome to {company.name}..!!!</h1>
        <h2>{company.description}</h2>
      </div>

      {/* Button to show assigned coaching programs */}
      <button 
        className={`button ${areProgramsVisible ? 'hide' : 'show'}`} 
        onClick={() => setAreProgramsVisible(!areProgramsVisible)}
      >
        {areProgramsVisible ? 'Hide Assigned Coaching Programs' : 'Show Assigned Coaching Programs'}
      </button>

      {areProgramsVisible && ( 
        <div>
          <h5>
            <ul style={{ listStyleType: 'none', padding: 0 }}>
              {company.coaching_programs.map(program => (
                <li key={program.id} style={{ margin: '10px 0' }}>
                  <span style={{ fontWeight: 'bold' }}>{program.title}</span>
                </li>
              ))}
            </ul>
          </h5>
        </div>
      )}
      <br></br>
      <button 
        className={`button ${isRegistrationVisible ? 'hide' : 'show'}`} 
        onClick={() => setIsRegistrationVisible(!isRegistrationVisible)}
      >
        {isRegistrationVisible ? 'Hide Registration Form' : 'Employee Registration'}
      </button>
      {isRegistrationVisible && ( 
        <div className="form">
          <h3>Employee Registration Form</h3>
          <form onSubmit={handleEmployeeSubmit}>
            <div>
              <label>Name:</label>
              <input
                type="text"
                value={employeeName}
                onChange={(e) => setEmployeeName(e.target.value)}
                required
                className="input"
              />
            </div>
            <div>
              <label>Email:</label>
              <input
                type="email"
                value={employeeEmail}
                onChange={(e) => setEmployeeEmail(e.target.value)}
                required
                className="input"
              />
            </div>
            <div>
              <label>Password:</label>
              <input
                type="password"
                value={employeePassword}
                onChange={(e) => setEmployeePassword(e.target.value)}
                required
                className="input"
              />
            </div>
            <div>
              <label>Confirm Password:</label>
              <input
                type="password"
                value={employeePasswordConfirmation}
                onChange={(e) => setEmployeePasswordConfirmation(e.target.value)}
                required
                className="input"
              />
            </div>
            <button 
              type="submit"
              className="button show"
            >
              Register
            </button>
          </form>
        </div>
      )}

      {successMessage && ( 
        <div className="success-message">
          {successMessage}
        </div>
      )}
      
      <div>
        <button 
          onClick={handleBackToCompanies} 
          className="back-button"
        >
          Back to Admin Dashboard
        </button>
      </div>
    </div>
  );
};

export default CompanyLandingPage;
