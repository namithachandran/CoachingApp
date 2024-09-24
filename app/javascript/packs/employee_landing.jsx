import React from 'react';
import ReactDOM from 'react-dom';
import EmployeeDashboard from '../components/EmployeeDashboard';

const EmployeeLanding = props => {
  // Extract the companyId from the URL
  const employeeId = window.location.pathname.split('/')[2]; // Adjust this if your URL structure is different

  return (
    <EmployeeDashboard employeeId={employeeId} />
  );
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <EmployeeLanding />,
    document.body.appendChild(document.createElement('div')),
  );
});
