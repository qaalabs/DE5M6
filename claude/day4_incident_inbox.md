# Incident Response Inbox Exercise

## 🚨 Initial Incident Alert

**TIME:** Tuesday, 1:20 PM  
**INCIDENT:** Customer-facing dashboard showing stale data

### Situation Summary
- Main customer dashboard hasn't updated since 10:20 AM (3 hours ago)
- Customers typically check dashboards daily for business operations
- Sales data and new customer registrations not appearing
- Fabric pipeline "Customer-Dashboard-ETL" showing "Failed" status since 9:05 AM

### Technical Context
- Pipeline failure appears related to overnight data source changes
- External vendor may have changed file format last night
- Data validation errors showing in pipeline logs
- Backend databases appear healthy - issue is in data ingestion layer

---

## 📧 Your Incident Response Inbox
*All messages received in the last 15 minutes - choose your priorities wisely*

### HIGH STAKES

**📧 CEO's PA**  
*"CEO needs comprehensive incident briefing before 2:15 PM board meeting. Requires: impact summary, root cause analysis, resolution timeline, and business risk assessment. This is urgent - board members are already asking questions."*

**📧 Sales Director**  
*"Critical: I need weekly sales numbers for board presentation in 55 minutes. Can you provide workaround data or alternative reporting? If not, I need to explain the delay to board with specific timeline for resolution."*

**📧 Premium Client (via Account Manager)**  
*"Our daily operations planning depends on your dashboard data. This affects our supply chain decisions and inventory management. When will full service be restored? Our CEO is asking for escalation options."*

### OPERATIONAL

**📧 Customer Service Manager**  
*"Phone calls increasing rapidly. Customers asking 'Why can't I see my updated sales data?' Need holding statement and estimated resolution time to provide consistent responses. Team needs guidance within next 10 minutes."*

**📧 Marketing Team Lead**  
*"New customer sign-up tracking is down - this affects our campaign performance reporting for today's marketing review meeting. Need status update and workaround options for measuring daily acquisition metrics."*

**📧 Service Desk Coordinator**  
*"Multiple tickets coming in about 'missing data' and 'dashboard not working.' Need technical details to provide Level 1 support responses. Also need escalation criteria for Priority 1 vs Priority 2 classifications."*

### TECHNICAL

**📧 Engineering Team Lead**  
*"Pipeline failure detected in Customer-Dashboard-ETL. Preliminary investigation suggests data validation errors. Need incident commander assignment and technical coordination. Can provide detailed logs and investigation support."*

**📧 External Vendor (Data Provider)**  
*"Received your urgent inquiry about overnight file format changes. Can confirm: we upgraded our export system last night (00:30-02:00). New format includes additional fields. Updated documentation available. Need technical contact for coordination."*

**📧 Database Administrator**  
*"Backend database systems running normally - no performance issues detected. All connection pools healthy. Issue appears upstream in data ingestion layer. Available for investigation support and manual data queries if needed."*

### ADMINISTRATIVE

**📧 IT Security Team**  
*"Incident alert received. Need classification: is this a security incident requiring breach protocols? External vendor involvement raises questions about data integrity. Require formal incident categorisation within 30 minutes."*

**📧 Compliance Officer**  
*"Data outage affecting customer-facing systems requires formal logging per corporate governance. Need incident reference number and initial impact assessment for regulatory reporting. Documentation deadline: end of business today."*

**📧 Public Communications Team**  
*"Should we update our public status page? Some customers posting on social media about 'broken dashboards.' Need decision on external communication strategy and approved messaging if required."*

---

## 🎯 Your Mission

**Time Limit:** 25 minutes  
**Team Size:** 3-4 people  

**Success Criteria:**
- Prioritise which stakeholders to respond to first (and why)
- Demonstrate appropriate communication style for each audience
- Balance technical investigation with stakeholder management
- Show effective team coordination under pressure

**Remember:** You cannot respond to everyone immediately. Real incident response is about making strategic choices about where to focus limited time and resources.

---

## 📱 Communication Platform

Use the incident response app to:
- Select appropriate recipients from dropdown list
- Craft professional, audience-specific messages
- Coordinate team responsibilities
- Track communication timeline

**From field:** Update to show your role (e.g., "Sarah (Incident Lead)")  
**To field:** Select from stakeholder dropdown  
**Message:** Professional incident communication