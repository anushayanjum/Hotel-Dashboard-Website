document.addEventListener('DOMContentLoaded', () => {
    const data = JSON.parse(document.getElementById('dashboard-data').textContent);
  
    function makeChart(ctxId, label, labels, dataset, bgColor, borderColor) {
      const ctx = document.getElementById(ctxId).getContext('2d');
      return new Chart(ctx, {
        type: 'bar',
        data: {
          labels,
          datasets: [{
            label,
            data: dataset,
            backgroundColor: bgColor,
            borderColor:    borderColor,
            borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            y: { beginAtZero: true }
          },
          plugins: {
            legend: { position: 'top' }
          }
        }
      });
    }
  
    // fill in a solid color or use your brand
    makeChart(
      'bookingsChart',
      'Bookings',
      data.bookings.labels,
      data.bookings.data,
      'rgba(0,165,207,0.2)',
      'rgba(0,165,207,1)'
    );
  
    makeChart(
      'revenueChart',
      'Revenue',
      data.revenue.labels,
      data.revenue.data,
      'rgba(0,86,128,0.2)',
      'rgba(0,86,128,1)'
    );
  
    makeChart(
      'guestChart',
      'Guests',
      data.guests.labels,
      data.guests.data,
      'rgba(0,165,207,0.2)',
      'rgba(0,165,207,1)'
    );
  });
  