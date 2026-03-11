import '../models/muscle_model.dart';

class MuscleService {
  static final MuscleService _instance = MuscleService._internal();

  factory MuscleService() {
    return _instance;
  }

  MuscleService._internal();

  late Map<String, MuscleNode> _hierarchy;

  Future<void> init() async {
    _hierarchy = _getBuiltInHierarchy();
  }

  Map<String, MuscleNode> _getBuiltInHierarchy() {
    return {
      'shoulders': MuscleNode(
        id: 'shoulders',
        name: 'Shoulders',
        children: {
          'deltoids': MuscleNode(
            id: 'deltoids',
            name: 'Deltoids',
            children: {
              'anterior_deltoid': MuscleNode(id: 'anterior_deltoid', name: 'Anterior Deltoid'),
              'lateral_deltoid': MuscleNode(id: 'lateral_deltoid', name: 'Lateral Deltoid'),
              'posterior_deltoid': MuscleNode(id: 'posterior_deltoid', name: 'Posterior Deltoid'),
            },
          ),
          'rotator_cuff': MuscleNode(
            id: 'rotator_cuff',
            name: 'Rotator Cuff',
            children: {
              'supraspinatus': MuscleNode(id: 'supraspinatus', name: 'Supraspinatus'),
              'infraspinatus': MuscleNode(id: 'infraspinatus', name: 'Infraspinatus'),
              'teres_minor': MuscleNode(id: 'teres_minor', name: 'Teres Minor'),
              'teres_major': MuscleNode(id: 'teres_major', name: 'Teres Major'),
              'subscapularis': MuscleNode(id: 'subscapularis', name: 'Subscapularis'),
            },
          ),
        },
      ),
      'chest': MuscleNode(
        id: 'chest',
        name: 'Chest',
        children: {
          'clavicular_pectoralis': MuscleNode(id: 'clavicular_pectoralis', name: 'Upper Chest'),
          'sternal_pectoralis': MuscleNode(id: 'sternal_pectoralis', name: 'Mid Chest'),
          'abdominal_pectoralis': MuscleNode(id: 'abdominal_pectoralis', name: 'Lower Chest'),
        },
      ),
      'back': MuscleNode(
        id: 'back',
        name: 'Back',
        children: {
          'trapezius': MuscleNode(
            id: 'trapezius',
            name: 'Trapezius',
            children: {
              'trapezius_upper': MuscleNode(id: 'trapezius_upper', name: 'Upper Trapezius'),
              'trapezius_middle': MuscleNode(id: 'trapezius_middle', name: 'Middle Trapezius'),
              'trapezius_lower': MuscleNode(id: 'trapezius_lower', name: 'Lower Trapezius'),
            },
          ),
          'latissimus_dorsi': MuscleNode(
            id: 'latissimus_dorsi',
            name: 'Latissimus Dorsi',
            children: {
              'lats_upper': MuscleNode(id: 'lats_upper', name: 'Upper Lats'),
              'lats_lower': MuscleNode(id: 'lats_lower', name: 'Lower Lats'),
              'lats_inner': MuscleNode(id: 'lats_inner', name: 'Inner Lats'),
              'lats_outer': MuscleNode(id: 'lats_outer', name: 'Outer Lats'),
            },
          ),
          'rhomboids': MuscleNode(id: 'rhomboids', name: 'Rhomboids'),
          'erector_spinae': MuscleNode(id: 'erector_spinae', name: 'Erector Spinae'),
        },
      ),
      'arms': MuscleNode(
        id: 'arms',
        name: 'Arms',
        children: {
          'biceps': MuscleNode(
            id: 'biceps',
            name: 'Biceps',
            children: {
              'biceps_long_head': MuscleNode(id: 'biceps_long_head', name: 'Long Head'),
              'biceps_short_head': MuscleNode(id: 'biceps_short_head', name: 'Short Head'),
            },
          ),
          'triceps': MuscleNode(
            id: 'triceps',
            name: 'Triceps',
            children: {
              'triceps_long_head': MuscleNode(id: 'triceps_long_head', name: 'Long Head'),
              'triceps_lateral_head': MuscleNode(id: 'triceps_lateral_head', name: 'Lateral Head'),
              'triceps_medial_head': MuscleNode(id: 'triceps_medial_head', name: 'Medial Head'),
            },
          ),
          'forearm': MuscleNode(
            id: 'forearm',
            name: 'Forearm',
            children: {
              'forearm_flexors': MuscleNode(id: 'forearm_flexors', name: 'Flexors'),
              'forearm_extensors': MuscleNode(id: 'forearm_extensors', name: 'Extensors'),
            },
          ),
          'brachialis': MuscleNode(id: 'brachialis', name: 'Brachialis'),
        },
      ),
      'core': MuscleNode(
        id: 'core',
        name: 'Core',
        children: {
          'rectus_abdominis': MuscleNode(
            id: 'rectus_abdominis',
            name: 'Rectus Abdominis',
            children: {
              'rectus_upper': MuscleNode(id: 'rectus_upper', name: 'Upper Abs'),
              'rectus_lower': MuscleNode(id: 'rectus_lower', name: 'Lower Abs'),
            },
          ),
          'obliques_external': MuscleNode(id: 'obliques_external', name: 'External Obliques'),
          'obliques_internal': MuscleNode(id: 'obliques_internal', name: 'Internal Obliques'),
          'transverse_abdominis': MuscleNode(id: 'transverse_abdominis', name: 'Transverse Abdominis'),
        },
      ),
      'legs': MuscleNode(
        id: 'legs',
        name: 'Legs',
        children: {
          'quadriceps': MuscleNode(
            id: 'quadriceps',
            name: 'Quadriceps',
            children: {
              'vastus_lateralis': MuscleNode(id: 'vastus_lateralis', name: 'Vastus Lateralis'),
              'vastus_medialis': MuscleNode(id: 'vastus_medialis', name: 'Vastus Medialis'),
              'vastus_intermedius': MuscleNode(id: 'vastus_intermedius', name: 'Vastus Intermedius'),
              'rectus_femoris': MuscleNode(id: 'rectus_femoris', name: 'Rectus Femoris'),
            },
          ),
          'hamstrings': MuscleNode(
            id: 'hamstrings',
            name: 'Hamstrings',
            children: {
              'biceps_femoris': MuscleNode(id: 'biceps_femoris', name: 'Biceps Femoris'),
              'semitendinosus': MuscleNode(id: 'semitendinosus', name: 'Semitendinosus'),
              'semimembranosus': MuscleNode(id: 'semimembranosus', name: 'Semimembranosus'),
            },
          ),
          'gluteus': MuscleNode(
            id: 'gluteus',
            name: 'Glutes',
            children: {
              'gluteus_maximus': MuscleNode(id: 'gluteus_maximus', name: 'Gluteus Maximus'),
              'gluteus_medius': MuscleNode(id: 'gluteus_medius', name: 'Gluteus Medius'),
              'gluteus_minimus': MuscleNode(id: 'gluteus_minimus', name: 'Gluteus Minimus'),
            },
          ),
          'calves': MuscleNode(
            id: 'calves',
            name: 'Calves',
            children: {
              'gastrocnemius': MuscleNode(id: 'gastrocnemius', name: 'Gastrocnemius'),
              'soleus': MuscleNode(id: 'soleus', name: 'Soleus'),
            },
          ),
          'hip_flexors': MuscleNode(
            id: 'hip_flexors',
            name: 'Hip Flexors',
            children: {
              'iliopsoas': MuscleNode(id: 'iliopsoas', name: 'Iliopsoas'),
              'sartorius': MuscleNode(id: 'sartorius', name: 'Sartorius'),
            },
          ),
        },
      ),
      'neck': MuscleNode(
        id: 'neck',
        name: 'Neck',
        children: {
          'sternocleidomastoid': MuscleNode(id: 'sternocleidomastoid', name: 'Sternocleidomastoid'),
          'scalene': MuscleNode(id: 'scalene', name: 'Scalene'),
          'levator_scapulae': MuscleNode(id: 'levator_scapulae', name: 'Levator Scapulae'),
          'splenius_capitis': MuscleNode(id: 'splenius_capitis', name: 'Splenius Capitis'),
          'splenius_cervicis': MuscleNode(id: 'splenius_cervicis', name: 'Splenius Cervicis'),
        },
      )
    };
  }

  List<MuscleNode> getCategories() => _hierarchy.values.toList();

  List<MuscleNode> getGroupsForCategory(String categoryId) {
    final category = _hierarchy[categoryId];
    if (category == null) return [];
    return category.children.values.toList();
  }

  List<MuscleNode> getChildrenForNode(String categoryId, String nodeId) {
    final category = _hierarchy[categoryId];

    if (category == null) return [];

    final node = category.children[nodeId];

    if (node == null) return [];

    return node.children.values.toList();
  }
}