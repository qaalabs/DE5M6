# Fire Drill Scenario 1: Customer Dashboard Failure

---

## Scenario Card (Give to ALL teams)

```
🚨 INCIDENT ALERT 🚨

TIME: Monday, 09:15 AM
INCIDENT: Customer-facing dashboard showing stale data

SITUATION:
• Main customer dashboard hasn't updated since 6 AM (3 hours ago)
• Customers typically check dashboards first thing Monday morning
• Weekend sales data and new customer registrations not appearing
• Fabric pipeline "Customer-Dashboard-ETL" showing "Failed" status since 06:30

IMMEDIATE IMPACT:
• Customer service receiving calls: "Why can't I see my weekend sales?"
• 3 major clients have called asking about data freshness
• Sales team can't access weekend performance data for Monday morning meeting
• Marketing team reporting new customer sign-ups not showing in dashboard

TECHNICAL CONTEXT:
• Pipeline failure appears to be related to weekend data source changes
• Source system (external vendor) may have changed file format over weekend
• Data validation errors showing in pipeline logs
• Backend databases appear healthy - issue is in data ingestion layer

STAKEHOLDER PRESSURE:
• Sales Director needs weekend numbers for 10 AM board meeting (45 minutes)
• Customer Success team escalating - premium clients are complaining
• IT Director asking for incident report and resolution timeline

YOUR MISSION:
You are the incident response team. Coordinate your response, investigate the root cause, implement fixes, and manage stakeholder communication.

REMEMBER: All official communications must go through Slack channel.
```

---

## Why This Scenario Works for All Teams

### Universal Pressure Points:
- **Time pressure:** Board meeting in 45 minutes
- **Customer impact:** Premium clients complaining  
- **Multiple stakeholders:** Sales, Customer Success, IT leadership
- **Technical complexity:** Data pipeline failure with vendor dependency

### Allows Consistent Optional Pressure Elements:

**5 minutes in:**
*"Customer service reports call volume doubled in last 5 minutes"*

**10 minutes in:**
*"@channel Premium client Acme Corp threatening to review contract due to data issues"*

**15 minutes in:**
*"Sales Director: 'Board meeting moved to 9:45 AM - need update NOW'"*

**20 minutes in:**
*"IT Director: 'CTO is asking questions - need technical root cause and timeline'"*

### Different Teams Can Take Different Approaches:
- **Team A:** Might focus on quick fix to get dashboard working
- **Team B:** Might prioritize customer communication while investigating  
- **Team C:** Might escalate immediately to vendor for source system info
- **Team D:** Might implement workaround while planning proper fix

### Realistic Complexity:
- **Not obvious fix:** Could be vendor issue, validation problem, or configuration error
- **Multiple options:** Quick fix vs. proper solution trade-off
- **Communication challenges:** Technical team vs. business stakeholder needs
- **Time pressure:** Real deadline creates authentic urgency

This single scenario gives you **consistent pressure management** while allowing **different team approaches** to emerge naturally for great debrief comparisons!

Ready for the escalation scenario next?