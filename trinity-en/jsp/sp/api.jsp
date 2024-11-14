<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    // createProject(name, description, owner_id, identifier, start_date, end_date)
    public String create_project(String url, String auth, String name, String description, String owner_id, String identifier , String start_date, String end_date) 
    
    // getProjectById(project_id)
    public String get_project_by_id(String url, String auth, String project_id) 
    
    // getProjectByName(name)
    public String get_project_by_name(String url, String auth, String name) 
    
    // getProjectByIdentifier(identifier)
    public String get_project_by_identifier(String url, String auth, String identifier) 
    
    // getProjectByEmail(email)
    public String get_project_by_email(String url, String auth, String email) 
    
    // getAllProjects()
    public String get_all_projects(String url, String auth) 
    
    // updateProject(project_id, name, description, owner_id, identifier, start_date, end_date)
    public String update_project(String url, String auth, String project_id, String name, String description, String owner_id, String identifier, String start_date, String end_date) 
    
    // removeProject(project_id)
    public String remove_project(String url, String auth, String project_id) 
    
    // getProjectActivity(project_id)
    public String get_project_activity(String url, String auth, String project_id) 
    
    // getProjectUsers(project_id)
    public String get_project_users(String url, String auth, String project_id) 
    
    // getAssignableUsers(project_id, prepend_unassigned :True/False)
    public String get_assignable_users(String url, String auth, String project_id) 
    
    // addProjectUser(project_id, user_id, role)
    public String get_add_project_user(String url, String auth, String project_id, String user_id, String role) 
    
    // addProjectGroup(project_id, group_id, role)
    public String get_add_project_group(String url, String auth, String project_id, String group_id, String role) 
    
    // removeProjectUser(project_id, user_id)
    public String remove_project_user(String url, String auth, String project_id, String user_id) 
    
    // removeProjectGroup(project_id, group_id)
    public String remove_project_group(String url, String auth, String project_id, String group_id) 
    
    // changeProjectUserRole(project_id, user_id, role)
    public String change_project_user_role(String url, String auth, String project_id, String user_id, String role) 
    
    // changeProjectGroupRole(project_id, group_id, role)
    public String change_project_group_role(String url, String auth, String project_id, String group_id, String role) 
    
    // getProjectUserRole(project_id, user_id)
    public String get_project_user_role(String url, String auth, String project_id, String user_id) 
    
    // createGroup(name, external_id)
    public String create_group(String url, String auth, String name, String external_id) 
    
    // updateGroup(group_id, name, external_id)
    public String update_group(String url, String auth,String group_id, String name, String external_id) 

    // removeGroup(group_id)
    public String remove_group(String url, String auth,String group_id) 

    // getGroup(group_id)
    public String get_group(String url, String auth, String group_id) 

    // getAllGroups()
    public String get_all_groups(String url, String auth) 

    // getMemberGroups(user_id)
    public String get_member_group(String url, String auth, String user_id) 

    // getGroupMembers(group_id)
    public String get_group_members(String url, String auth, String group_id) 

    // addGroupMember(group_id, user_id)
    public String add_group_member(String url, String auth, String group_id, String user_id) 

    // removeGroupMember(group_id, user_id)
    public String remove_group_member(String url, String auth, String group_id, String user_id) 

    // isGroupMember(group_id, user_id)
    public String is_group_member(String url, String auth, String group_id, String user_id) 
    
    // getBoard(project_id) <-- All Columns.....
    public String get_board(String url, String auth, String project_id) 
    
    // getColumns(project_id)
    public String get_columns(String url, String auth, String project_id) 

    // getColumn(column_id)
    public String get_column(String url, String auth, String column_id) 

    // changeColumnPosition(project_id, column_id, position)
    public String change_column_position(String url, String auth, String project_id, String column_id, String position) 

    // updateColumn(column_id, title, task_limit, description)
    public String update_column(String url, String auth, String column_id, String title, String task_limit, String description) 

    // addColumn(project_id, title, task_limit, description)
    public String add_column(String url, String auth, String project_id, String title, String task_limit, String description) 

    // removeColumn(column_id)
    public String remove_column(String url, String auth, String column_id) 
    
    // getActiveSwimlanes(project_id)
    public String get_active_swimlanes(String url, String auth, String project_id) 

    // getAllSwimlanes(project_id)
    public String get_all_swimlanes(String url, String auth, String project_id) 

    // getSwimlane(swimlane_id)
    public String get_swimlane(String url, String auth, String swimlane_id) 

    // getSwimlaneById(swimlane_id)
    public String get_swimlane_by_id(String url, String auth, String swimlane_id) 

    // getSwimlaneByName(project_id, name)
    public String get_swimlane_by_name(String url, String auth, String name) 

    // changeSwimlanePosition(project_id, swimlane_id, position)
    public String change_swimlane_position(String url, String auth, String project_id, String swimlane_id, String position) 

    // updateSwimlane(project_id, swimlane_id, name, description)
    public String update_swimlane(String url, String auth, String swimlane_id, String name, String description) 

    // addSwimlane(project_id, name, description)
    public String add_swimlane(String url, String auth, String project_id, String name, String description) 

    // removeSwimlane(project_id, swimlane_id)
    public String remove_swimlane(String url, String auth, String project_id, String swimlane_id) 
    
    // createTask(title, project_id, color_id, column_id, owner_id, creator_id, date_due,
    //           description, category_id, score, swimlane_id, priority,
    //           recurrence_status,
    //           recurrence_trigger,
    //           recurrence_factor,
    //           recurrence_timeframe,
    //           recurrence_basedate,
    //           reference,
    //           tags,
    //           date_started)
    public String create_task(String url, String auth, String title, String project_id, String color_id, String owner_id, String creator_id, String date_due,
    			String description,String  category_id,String  score,String  swimlane_id,String  priority,
    			String recurrence_status,
    			String recurrence_trigger,
    			String recurrence_factor,
    			String recurrence_timeframe,
    			String recurrence_basedate,
    			String reference,
    			String tags,
    			String date_started) 

    public String create_task(String url, String auth, String title, String project_id,  String owner_id) 

    public String create_task(String url, String auth, String title, String project_id,  String owner_id, String date_started, String date_due) 
    
    // getTask(task_id)
    public String get_task(String url, String auth, String task_id) 

    // getTaskByReference(project_id, reference)
    public String get_task_by_reference(String url, String auth, String project_id, String reference) 

    // getAllTasks(project_id, status_id ( 1 , 0 ) )
    public String get_all_tasks(String url, String auth, String project_id, String status_id) 

    // getOverdueTasks()
    public String get_all_tasks(String url, String auth) 

    // getOverdueTasksByProject(project_id)
    public String get_overdue_tasks_by_project(String url, String auth, String project_id) 

    // updateTask(id, title, color_id, owner_id, date_due,
    //           description, category_id, score, priority,
    //           recurrence_status,
    //           recurrence_trigger,
    //           recurrence_factor,
    //           recurrence_timeframe,
    //           recurrence_basedate,
    //           reference,
    //           tags,
    //           date_started)
    public String update_task(String url, String auth,String id, String title, String color_id, String owner_id, String creator_id, String date_due,
			String description,String  category_id,String  score,String  swimlane_id,String  priority,
			String recurrence_status,
			String recurrence_trigger,
			String recurrence_factor,
			String recurrence_timeframe,
			String recurrence_basedate,
			String reference,
			String tags,
			String date_started) 

    public String update_task(String url, String auth,String id, String title, String owner_id) 

    public String update_task(String url, String auth,String id, String title, String owner_id, String date_started, String date_due) 

    // openTask(task_id)
    public String open_task(String url, String auth, String task_id) 

    // closeTask(task_id)
    public String close_task(String url, String auth, String task_id) 

    // removeTask(task_id)
    public String remove_task(String url, String auth, String task_id) 

    // moveTaskPosition(project_id, task_id, column_id, position, swimlane_id)
    public String move_task_position(String url, String auth, String project_id, String task_id , String column_id, String position, String swimlane_id) 

    // moveTaskToProject(task_id, project_id, swimlane_id, category_id, owner_id)
    public String move_task_to_project(String url, String auth,String task_id, String project_id, String swimlane_id , String category_id, String owner_id) 

    // searchTasks(project_id, query)
    public String search_tasks(String url, String auth, String project_id, String query) 

    // createSubtask(task_id, title, user_id, time_estimated, time_spent, status)
    public String create_subtask(String url, String auth, String title, String user_id, String time_estimated, String time_spent, String status) 

    public String create_subtask(String url, String auth, String title, String user_id) 

    // getSubtask(subtask_id)
    public String get_subtask(String url, String auth, String subtask_id) 

    // getAllSubtasks(task_id)
    public String get_all_subtasks(String url, String auth, String task_id) 

    // updateSubtask(id, task_id, title, user_id, time_estimated, time_spent, status)
    public String update_subtask(String url, String auth, String id, String task_id,String title, String user_id, String time_estimated, String time_spent, String status) 

    public String update_subtask(String url, String auth, String id, String task_id, String title, String user_id) 

    // removeSubtask(subtask_id)
    public String remove_subtask(String url, String auth, String subtask_id) 

    // hasSubtaskTimer(subtask_id, user_id)
    public String has_subtask_timer(String url, String auth, String subtask_id, String user_id) 

    // setSubtaskStartTime(subtask_id, user_id)
    public String set_subtask_start_time(String url, String auth, String subtask_id, String user_id) 

    // setSubtaskEndTime(subtask_id, user_id)
    public String set_subtask_end_time(String url, String auth, String subtask_id, String user_id) 

    // getSubtaskTimeSpent(subtask_id, user_id)
    public String get_subtask_time_spent(String url, String auth, String subtask_id, String user_id) 
    
    // getAvailableActions()
    public String get_available_actions(String url, String auth) 

    // getAvailableActionEvents()
    public String get_available_action_events(String url, String auth) 

    // getCompatibleActionEvents(action_name)
    public String get_compatible_action_events(String url, String auth, String action_name) 

    // getActions(project_id)
    public String get_actions(String url, String auth, String project_id) 

    // createAction(project_id, event_name, action_name, params })
    public String create_action(String url, String auth, String project_id, String column_id, String user_id) 
    
    // removeAction(action_id)
    public String remove_action(String url, String auth, String action_id) 

    // createCategory(project_id, name)
    public String create_category(String url, String auth, String project_id, String name) 
    
    // getCategory(category_id)
    public String get_category(String url, String auth, String category_id) 

    // getAllCategories(project_id)
    public String get_all_categories(String url, String auth, String project_id) 

    // updateCategory(id, name)
    public String update_category(String url, String auth, String id, String name) 

    // removeCategory(category_id)
    public String remove_category(String url, String auth, String category_id) 

    // createComment(task_id, user_id, content)
    public String create_comment(String url, String auth, String task_id, String user_id, String content) 

    // getComment(comment_id)
    public String get_comment(String url, String auth, String comment_id) 

    // getAllComments(task_id)
    public String get_all_comments(String url, String auth, String task_id) 

    // updateComment(id, content)
    public String update_comment(String url, String auth, String id, String content) 

    // removeComment(comment_id)
    public String remove_comment(String url, String auth, String comment_id) 

    // createUser(username, password, name, email, role)
    public String create_user(String url, String auth, String username, String password, String name, String email, String role) 

    // getUser(user_id)
    public String get_user(String url, String auth, String user_id) 
