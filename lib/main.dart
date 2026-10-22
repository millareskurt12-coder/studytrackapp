import 'package:flutter/material.dart';

const forest = Color(0xFF183B32);
const leaf = Color(0xFFE8F1E4);
const coral = Color(0xFFF0785C);
const butter = Color(0xFFF2C96D);
const paper = Color(0xFFFFFCF6);
const muted = Color(0xFF718079);

void main() => runApp(const StudyTrackApp());

class StudyTrackApp extends StatelessWidget {
  const StudyTrackApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'StudyTrack',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: paper,
          colorScheme: ColorScheme.fromSeed(seedColor: forest, surface: paper),
          fontFamily: 'Georgia',
        ),
        home: const SplashScreen(),
      );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: leaf,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 24, 28, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Brand(),
                      const SizedBox(height: 32),
                      const _FocusIllustration(),
                      const SizedBox(height: 30),
                      const Text(
                        'Small steps.\nBig chapters.',
                        style: TextStyle(
                          color: forest,
                          fontSize: 42,
                          height: 1.08,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Make room for focused study, one session at a time.',
                        style: TextStyle(
                          color: forest,
                          fontFamily: 'sans-serif',
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 26),
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: FilledButton.icon(
                          key: const Key('start-studying'),
                          onPressed: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                              builder: (_) => const TodayScreen(),
                            ),
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor: forest,
                            foregroundColor: paper,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(Icons.arrow_forward_rounded),
                          label: const Text(
                            'Start tracking',
                            style: TextStyle(
                              fontFamily: 'sans-serif',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Center(
                        child: Text(
                          'A calmer way to keep showing up',
                          style: TextStyle(
                            color: muted,
                            fontFamily: 'sans-serif',
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: coral,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(Icons.auto_graph_rounded, color: paper, size: 22),
          ),
          const SizedBox(width: 10),
          const Text(
            'studytrack',
            style: TextStyle(
              color: forest,
              fontFamily: 'sans-serif',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ],
      );
}

class _FocusIllustration extends StatelessWidget {
  const _FocusIllustration();

  @override
  Widget build(BuildContext context) => Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.85, end: 1),
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeOutBack,
          builder: (context, scale, child) => Transform.scale(
            scale: scale,
            child: child,
          ),
          child: SizedBox(
            height: 210,
            width: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 196,
                  height: 196,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD7E6D2),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 30,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: butter,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.wb_sunny_rounded, color: forest),
                  ),
                ),
                Positioned(
                  left: 4,
                  bottom: 30,
                  child: Transform.rotate(
                    angle: -0.08,
                    child: Container(
                      width: 138,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: paper,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x183B503D),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TODAY',
                            style: TextStyle(
                              color: muted,
                              fontFamily: 'sans-serif',
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 12),
                          _MiniTask('Read chapter 4', true),
                          SizedBox(height: 9),
                          _MiniTask('Review notes', false),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  bottom: 12,
                  child: Container(
                    width: 116,
                    height: 116,
                    decoration: BoxDecoration(
                      color: forest,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x243B503D),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hourglass_bottom_rounded, color: butter),
                        SizedBox(height: 6),
                        Text(
                          '25:00',
                          style: TextStyle(
                            color: paper,
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          'FOCUS SESSION',
                          style: TextStyle(
                            color: Color(0xFFB7C9BE),
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w600,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 24,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: coral,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _MiniTask extends StatelessWidget {
  const _MiniTask(this.label, this.done);

  final String label;
  final bool done;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(
            done ? Icons.check_circle_rounded : Icons.circle_outlined,
            color: done ? coral : const Color(0xFFB9C2BA),
            size: 14,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: forest,
                fontFamily: 'sans-serif',
                fontSize: 9,
              ),
            ),
          ),
        ],
      );
}

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final List<_StudyTask> _tasks = [
    _StudyTask('Review lecture notes', 'BIOLOGY', 30),
    _StudyTask('Practice problem set', 'MATHS', 45),
    _StudyTask('Read chapter four', 'HISTORY', 25),
  ];

  int get _completedCount => _tasks.where((task) => task.isDone).length;

  Future<void> _addTask() async {
    final controller = TextEditingController();
    final title = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: paper,
        title: const Text('Add a study task'),
        content: TextField(
          controller: controller,
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(hintText: 'What will you study?'),
          onSubmitted: (value) => Navigator.pop(context, value.trim()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('Add task'),
          ),
        ],
      ),
    );
    controller.dispose();
    if (title != null && title.isNotEmpty && mounted) {
      setState(() => _tasks.add(_StudyTask(title, 'PERSONAL', 25)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = _tasks.isEmpty ? 0.0 : _completedCount / _tasks.length;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 32),
              sliver: SliverList.list(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'YOUR STUDY SPACE',
                              style: TextStyle(
                                color: muted,
                                fontFamily: 'sans-serif',
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Today, at your pace.',
                              style: TextStyle(
                                color: forest,
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: leaf,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.calendar_today_rounded,
                            color: forest, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: forest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'A little progress\nadds up.',
                                style: TextStyle(
                                  color: paper,
                                  fontSize: 23,
                                  height: 1.2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '$_completedCount of ${_tasks.length} tasks complete',
                                style: const TextStyle(
                                  color: Color(0xFFD3E0D7),
                                  fontFamily: 'sans-serif',
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 74,
                          height: 74,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 6,
                                backgroundColor: const Color(0xFF49675D),
                                color: butter,
                              ),
                              Text(
                                '${(progress * 100).round()}%',
                                style: const TextStyle(
                                  color: paper,
                                  fontFamily: 'sans-serif',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Study plan',
                          style: TextStyle(
                            color: forest,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      IconButton.filledTonal(
                        onPressed: _addTask,
                        tooltip: 'Add study task',
                        icon: const Icon(Icons.add_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  for (var index = 0; index < _tasks.length; index++)
                    _TaskTile(
                      task: _tasks[index],
                      onChanged: (value) => setState(
                        () => _tasks[index].isDone = value ?? false,
                      ),
                    ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF1DF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.lightbulb_outline_rounded, color: coral),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Take a short break between focused sessions.',
                            style: TextStyle(
                              color: forest,
                              fontFamily: 'sans-serif',
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StudyTask {
  _StudyTask(this.title, this.subject, this.minutes);

  final String title;
  final String subject;
  final int minutes;
  bool isDone = false;
}

class _TaskTile extends StatelessWidget {
  const _TaskTile({required this.task, required this.onChanged});

  final _StudyTask task;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE8EAE4)),
        ),
        child: Material(
          color: Colors.transparent,
          child: CheckboxListTile(
            value: task.isDone,
            onChanged: onChanged,
            activeColor: forest,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: const EdgeInsets.fromLTRB(8, 4, 14, 4),
            title: Text(
              task.title,
              style: TextStyle(
                color: forest,
                fontFamily: 'sans-serif',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              '${task.subject} / ${task.minutes} min',
              style: const TextStyle(
                color: muted,
                fontFamily: 'sans-serif',
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
}