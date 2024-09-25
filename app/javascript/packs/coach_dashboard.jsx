import React from 'react';
import ReactDOM from 'react-dom';
import CoachDashboardPage from '../components/CoachDashboardPage';

const CoachDashboard = props => {
  // Extract the coachId from the URL
  const coachId =  window.location.pathname.split('/')[2]; 

  return (
    <CoachDashboardPage coachId={coachId} />
  );
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <CoachDashboard />,
    document.body.appendChild(document.createElement('div')),
  );
});
