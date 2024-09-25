import React from 'react';
import ReactDOM from 'react-dom';
import CompanyLandingPage from '../components/CompanyLandingPage';

const CompanyLanding = props => {
  // Extract the companyId from the URL
  const companyId = window.location.pathname.split('/').pop(); 
  return (
    <CompanyLandingPage companyId={companyId} />
  );
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <CompanyLanding />,
    document.body.appendChild(document.createElement('div')),
  );
});
