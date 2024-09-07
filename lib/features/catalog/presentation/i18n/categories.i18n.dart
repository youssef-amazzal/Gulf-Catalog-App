import 'package:i18n_extension/i18n_extension.dart';

extension Localization on Object {
  static const _t = ConstTranslations('en_us', {
    'additive': {'en': 'Additives', 'fr': 'Additifs'},
    'amortisseur': {'en': 'Shock Absorbers', 'fr': 'Amortisseurs'},
    'battery': {'en': 'Battery', 'fr': 'Batterie'},
    'butee_hydraulique': {
      'en': 'Clutch Release Bearings',
      'fr': 'Butée Hydraulique'
    },
    'courroie': {'en': 'Timing Belts', 'fr': 'Courroies de Distribution'},
    'cylindre_emetteur': {
      'en': 'Clutch Master Cylinders',
      'fr': 'Cylindres Émetteurs'
    },
    'cylindre_recepteur': {
      'en': 'Clutch Slave Cylinders',
      'fr': 'Cylindres Récepteurs'
    },
    'cylindre_roue': {'en': 'Wheel Cylinders', 'fr': 'Cylindres de Roue'},
    'disque': {'en': 'Brake Discs', 'fr': 'Disques de Frein'},
    'filter': {'en': 'Filters', 'fr': 'Filtres'},
    'filter_air': {'en': 'Air Filters', 'fr': 'Filtres à Air'},
    'filter_carburant': {'en': 'Fuel Filters', 'fr': 'Filtres à Carburant'},
    'filter_dessiccateur': {
      'en': 'Desiccant Filters',
      'fr': 'Filtres Dessiccateurs'
    },
    'filter_habitacle': {'en': 'Cabin Filters', 'fr': 'Filtres d\'Habitacle'},
    'filter_huile': {'en': 'Oil Filters', 'fr': 'Filtres à Huile'},
    'filter_hydraulique': {
      'en': 'Hydraulic Filters',
      'fr': 'Filtres Hydrauliques'
    },
    'filter_liquide': {'en': 'Fluid Filters', 'fr': 'Filtres à Liquide'},
    'indicateur_usure': {'en': 'Wear Indicators', 'fr': 'Indicateurs d\'Usure'},
    'kit_chain': {'en': 'Timing Chains', 'fr': 'Chaînes de Distribution'},
    'kit_courroie': {'en': 'Timing Kits', 'fr': 'Kits de Courroies'},
    'machoire_frein': {'en': 'Brake Shoes', 'fr': 'Mâchoires de Frein'},
    'maitre_cylindre': {
      'en': 'Brake Master Cylinders',
      'fr': 'Maîtres-Cylindres de Frein'
    },
    'maitre_cylindre_embrayage': {
      'en': 'Clutch Master Cylinders',
      'fr': 'Maîtres-Cylindres d\'Embrayage'
    },
    'plaquette': {'en': 'Brake Pads', 'fr': 'Plaquettes de Frein'},
    'pompe_eau': {'en': 'Water Pumps', 'fr': 'Pompes à Eau'},
    'radiateur': {'en': 'Radiators', 'fr': 'Radiateurs'},
    'roulement_roue': {'en': 'Wheel Bearings', 'fr': 'Roulements de Roue'}
  });

  String get i18n => localize(this, _t);
}
