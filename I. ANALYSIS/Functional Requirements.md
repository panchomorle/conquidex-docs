### **Functional Requirements**

### **User Management**

1. **Registration and Login:**
    - The system must provide a registration and login module for leaders and counselors.
    - Only authenticated users can access the system's core functionalities.
2. **Role Management:**
    - Users must be assigned one of the following roles: Pathfinder, Counselor, or Leader.
    - Ensure that role-based access control is implemented:
        - Pathfinders can only view their achievements and attendance records.
        - Counselors can assign classes, manage attendance, and create events.
        - Leaders can create events and oversee attendance and achievements but cannot modify pathfinder data.

### **Member and Achievement Tracking**

1. **Achievement Registration:**
    - Enable leaders or counselors to record the following:
        - Completed class items (e.g., tasks or objectives).
        - Honors earned by members.
    - Apply the achievement tracking functionality to all members in the system.
2. **Entity Association:**
    - Each member must have a class and a unit. If not assigned, they default to:
        - `Class = Unassigned`.
        - `Unit = Unassigned`.
    - Pathfinders:
        - Can belong to one or more classes.
        - Can belong to only one unit.
    - Counselors and leaders:
        - Can belong to multiple units and classes.

### **Calendar and Events**

1. **Event Management:**
    - The system must allow leaders and counselors to create events in a shared calendar.
    - Validate the following during event creation:
        - `startDateTime` must be earlier than `endDateTime`.
        - Events with the same name and location must not overlap.
2. **Attendance Management:**
    - Record attendance for each event.
    - Associate attendance records with specific achievements.
    - Attendance status must be one of:
        - `Attended`
        - `Late`
        - `Absent`

### **Consistency Validation**

1. **Role-Based Restrictions:**
    - Prevent Pathfinders from being assigned as event organizers.
    - Allow only counselors to self-assign classes and manage attendance for those classes.
