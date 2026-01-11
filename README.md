# Airline Revenue Management Analytics Dashboard  
**Tools:** Microsoft SQL Server | Power BI | Airline Revenue KPIs  

## 📌 Project Overview
This project delivers an end-to-end **Airline Revenue Management Analytics Dashboard** designed to support commercial and revenue management decision-making.  
Using airline booking, flight, route, and competitive fare data, the dashboard evaluates **route profitability, capacity utilization, pricing performance, demand behavior, and revenue management (RM) action effectiveness**.

The project mirrors real-world airline commercial analytics used by global carriers such as Qatar Airways.

---

## 🎯 Business Objectives
- Identify high and low performing routes by revenue and passenger volume  
- Measure **Load Factor** and capacity utilization  
- Evaluate **RASK (Revenue per Available Seat Kilometer)**  
- Analyze booking behavior and advance purchase patterns  
- Assess cabin and fare class mix contribution  
- Understand Point-of-Sale (POS) and sales channel effectiveness  
- Quantify revenue uplift from revenue management actions  
- Benchmark fares against competitors  

---

## 🗄️ Data Sources
The project uses structured airline operational data stored in **Microsoft SQL Server**:

| Table | Description |
|-----|-------------|
| `my_bookings` | Passenger bookings, pricing, cabin, POS, and channel data |
| `flights` | Flight schedule, capacity, route mapping |
| `routes` | Origin, destination, distance |
| `revenue_management_actions` | Pricing and inventory interventions |
| `competition` | Competitor fare benchmarks |

---

## 🧱 Data Modeling Approach
- SQL queries were transformed into **analytical views** (fact-style datasets)
- Power BI data model follows a **star schema**
- Measures calculated using **DAX** for airline KPIs

---

## 📊 Key SQL Analytics
The following analytical datasets were created using SQL:

- **Route Revenue Performance**
- **Load Factor Analysis**
- **RASK Calculation**
- **Booking Curve (Advance Purchase Behavior)**
- **Cabin & Fare Class Mix**
- **Revenue by POS Country**
- **Sales Channel Effectiveness**
- **Revenue Before vs After RM Actions**
- **Competitive Fare Benchmarking**

---

## 📈 Power BI Dashboard Pages

### 1️⃣ Executive Revenue Overview
- Total Revenue
- Total Passengers
- Average Fare
- Network Load Factor
- Route Revenue Ranking

### 2️⃣ Capacity & Load Factor Analysis
- Booked Seats vs Capacity
- Load Factor by Flight
- Identification of underperforming flights

### 3️⃣ Pricing Performance (RASK & Yield)
- RASK by Route
- Yield vs Load Factor analysis
- High-yield route identification

### 4️⃣ Booking Curve & Demand Timing
- Advance purchase distribution
- Booking behavior by cabin and route

### 5️⃣ Cabin & Fare Class Mix
- Revenue contribution by cabin
- Fare class revenue and passenger mix

### 6️⃣ POS & Sales Channel Performance
- Revenue by Point-of-Sale country
- Channel yield and passenger contribution

### 7️⃣ Revenue Management Impact
- Revenue comparison during RM actions vs no action
- Average revenue per flight uplift

### 8️⃣ Competitive Fare Benchmark
- Airline fare vs competitor fare
- Route-level pricing position analysis

---

## 📐 Key Metrics & KPIs
- **Load Factor (%)**
- **RASK**
- **Yield per Passenger**
- **Average Fare**
- **Revenue per Flight**
- **Passenger Volume**
- **Revenue Uplift from RM Actions**

---

## 🧠 Business Insights Enabled
- Identification of structurally weak routes
- Pricing and capacity optimization opportunities
- Effectiveness of RM pricing and inventory actions
- Demand sensitivity based on booking timing
- Competitive pricing gaps by route

---

## 🚀 Skills Demonstrated
- Airline revenue management analytics
- Advanced SQL querying and aggregation
- Power BI data modeling and DAX
- Commercial KPI design
- Executive-level dashboard storytelling

---

## 🧩 Future Enhancements
- Demand forecasting models
- What-if pricing simulations
- Elasticity-based fare optimization
- Integration with real-time booking feeds

---

## 👤 Author
**John Kipkemboi Kimaiyo**  
Data & Revenue Analytics Professional  

---

## 📄 License
This project is for educational and portfolio demonstration purposes only.
