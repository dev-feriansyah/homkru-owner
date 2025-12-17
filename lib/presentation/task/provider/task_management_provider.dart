import 'package:flutter/material.dart';

class TaskManagementProvider extends ChangeNotifier {
  // Form Controllers
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController assignedForController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  // State Variables
  String selectedAssignee = 'James Miller';
  bool requirePhoto = false;
  List<String> assignees = ['James Miller', 'John Doe', 'Jane Smith'];
  List<String> frequencyOptions = ['Daily', 'Weekly', 'Monthly', 'Yearly'];
  List<String> selectedPreferences = ['Bedroom', 'Drawing room'];
  List<String> durationOptions = ['1 hour', '2 hours', '3 hours', '4 hours'];
  List<String> timeOptions = ['10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM'];
  List<String> availablePreferences = [
    'Bedroom',
    'Kitchen',
    'Bathroom',
    'Dining room',
    'Drawing room',
  ];

  // Task Mode Selection
  bool isCreateFromScratch = true;

  // Loading State
  bool isLoading = false;

  // Suggested Tasks Data
  List<Map<String, dynamic>> suggestedTasks = [
    {'title': 'Clean Kitchen', 'isSelected': true, 'requirePhoto': false},
  ];

  // Scope of Work Data
  String? selectedFrequency;
  String? selectedTime;
  String? selectedDuration;

  String selectedHelper = 'KC James Miller';
  String selectedRoom = 'Kitchen';
  List<String> alreadyAddedTasks = ['Clean room', 'Dusting'];
  String floorInput = '';

  // Frequency Data
  // String selectedFrequency = '';
  // String selectedTime = '';
  // String selectedDuration = '';

  // Sub Tasks Data
  String subTaskInput = '';
  List<TextEditingController> subTaskControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  // Redo Parameters Data
  String selectedDeadline = '';
  String redoReason = '';

  // Getters
  bool get isCreateFromScratchMode => isCreateFromScratch;
  bool get isPhotoRequired => requirePhoto;
  List<String> get selectedPrefs => selectedPreferences;
  List<String> get availablePrefs => availablePreferences;
  String get currentAssignee => selectedAssignee;

  // Methods
  void toggleTaskMode() {
    isCreateFromScratch = !isCreateFromScratch;
    notifyListeners();
  }

  void setTaskMode(bool isFromScratch) {
    isCreateFromScratch = isFromScratch;
    notifyListeners();
  }

  // Suggested Tasks Methods
  void toggleSuggestedTask(int index) {
    if (index < suggestedTasks.length) {
      suggestedTasks[index]['isSelected'] =
          !suggestedTasks[index]['isSelected'];
      notifyListeners();
    }
  }

  void toggleSuggestedTaskPhoto(int index) {
    if (index < suggestedTasks.length) {
      suggestedTasks[index]['requirePhoto'] =
          !suggestedTasks[index]['requirePhoto'];
      notifyListeners();
    }
  }

  // Scope of Work Methods
  void updateSelectedHelper(String helper) {
    selectedHelper = helper;
    notifyListeners();
  }

  void updateSelectedRoom(String room) {
    selectedRoom = room;
    notifyListeners();
  }

  void addTaskToScope(String task) {
    if (task.isNotEmpty && !alreadyAddedTasks.contains(task)) {
      alreadyAddedTasks.add(task);
      notifyListeners();
    }
  }

  void removeTaskFromScope(String task) {
    alreadyAddedTasks.remove(task);
    notifyListeners();
  }

  void updateFloorInput(String floor) {
    floorInput = floor;
    notifyListeners();
  }

  // Frequency Methods
  void updateFrequency(String frequency) {
    selectedFrequency = frequency;
    notifyListeners();
  }

  void updateTime(String time) {
    selectedTime = time;
    notifyListeners();
  }

  void updateDuration(String duration) {
    selectedDuration = duration;
    notifyListeners();
  }

  // Sub Tasks Methods
  void updateSubTaskInput(String subTask) {
    subTaskInput = subTask;
    notifyListeners();
  }

  // Redo Parameters Methods
  void updateDeadline(String deadline) {
    selectedDeadline = deadline;
    notifyListeners();
  }

  void updateRedoReason(String reason) {
    redoReason = reason;
    notifyListeners();
  }

  void updateAssignee(String assignee) {
    selectedAssignee = assignee;
    notifyListeners();
  }

  void togglePhotoRequirement() {
    requirePhoto = !requirePhoto;
    notifyListeners();
  }

  void setRequirePhoto(bool value) {
    requirePhoto = value;
    notifyListeners();
  }

  void togglePreference(String preference) {
    if (selectedPreferences.contains(preference)) {
      selectedPreferences.remove(preference);
    } else {
      selectedPreferences.add(preference);
    }
    notifyListeners();
  }

  void addCustomPreference(String preference) {
    if (!availablePreferences.contains(preference) && preference.isNotEmpty) {
      availablePreferences.add(preference);
      selectedPreferences.add(preference);
      notifyListeners();
    }
  }

  void addSubTaskController() {
    subTaskControllers.add(TextEditingController());
    notifyListeners();
  }

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  // Form Validation
  bool isFormValid() {
    return taskNameController.text.isNotEmpty &&
        assignedForController.text.isNotEmpty &&
        taskDescriptionController.text.isNotEmpty;
  }

  // Clear Form
  void clearForm() {
    taskNameController.clear();
    assignedForController.clear();
    taskDescriptionController.clear();
    frequencyController.clear();
    timeController.clear();
    durationController.clear();
    selectedPreferences = ['Bedroom', 'Drawing room'];
    requirePhoto = false;

    // Clear sub-task controllers
    for (var controller in subTaskControllers) {
      controller.clear();
    }

    notifyListeners();
  }

  // Create Task
  Future<void> createTask() async {
    if (!isFormValid()) {
      return;
    }

    setLoading(true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Here you would typically make an API call to create the task
      // For now, we'll just simulate success

      // Clear form after successful creation
      clearForm();
    } catch (e) {
      // Handle error
      debugPrint('Error creating task: $e');
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    taskNameController.dispose();
    assignedForController.dispose();
    taskDescriptionController.dispose();
    frequencyController.dispose();
    timeController.dispose();
    durationController.dispose();

    // Dispose sub-task controllers
    for (var controller in subTaskControllers) {
      controller.dispose();
    }

    super.dispose();
  }
}
