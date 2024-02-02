import 'package:paldex/models/pal_active_skills.dart';
import 'package:paldex/models/pal_partner_skills.dart';

import 'obtained_item.dart';
import 'pal_element.dart';
import 'work_skill.dart';

class Pal {
  final int palId;
  final String name;
  final String imagePath;
  final String companionAbility;
  final int foodQuantity;
  final int numero;
  final String nickname;
  final String size;
  final int rarity;
  final int hp;
  final int meleeAttack;
  final int magicAttack;
  final int defense;
  final int support;
  final int craftingSpeed;
  final int captureRate;
  final int price;
  final int slowWalkSpeed;
  final int runSpeed;
  final int sprintSpeed;
  final double maleProbability;
  final List<PalElement> elementos;
  final List<ObtainedItem> obtainedItems;
  final List<WorkSkill> workSkills;
  final List<PalActiveSkills> activeSkills;
  final List<PalPartnerSkills> palPartnerSkills;

  Pal({
    required this.palId,
    required this.name,
    required this.imagePath,
    required this.companionAbility,
    required this.foodQuantity,
    required this.numero,
    required this.nickname,
    required this.size,
    required this.rarity,
    required this.hp,
    required this.meleeAttack,
    required this.magicAttack,
    required this.defense,
    required this.support,
    required this.craftingSpeed,
    required this.captureRate,
    required this.price,
    required this.slowWalkSpeed,
    required this.runSpeed,
    required this.sprintSpeed,
    required this.maleProbability,
    required this.elementos,
    required this.obtainedItems,
    required this.workSkills,
    required this.activeSkills,
    required this.palPartnerSkills
  });

  factory Pal.fromMap(Map<String, dynamic> map) {
    return Pal(
      palId: map['palId'],
      name: map['name'],
      imagePath: map['imagePath'],
      companionAbility: map['companionSkill'],
      foodQuantity: map['foodQuantity'],
      numero: map['number'],
      nickname: map['nickname'],
      size: map['size'],
      rarity: map['rarity'],
      hp: map['hp'],
      meleeAttack: map['meleeAttack'],
      magicAttack: map['magicAttack'],
      defense: map['defense'],
      support: map['support'],
      craftingSpeed: map['craftingSpeed'],
      captureRate: map['captureRate'],
      price: map['price'],
      slowWalkSpeed: map['slowWalkSpeed'],
      runSpeed: map['runSpeed'],
      sprintSpeed: map['sprintSpeed'],
      maleProbability: map['maleProbability'],
      elementos: List<PalElement>.from(map['elements'].map((x) => PalElement.fromMap(x))),
      obtainedItems: List<ObtainedItem>.from(map['obtainedItems'].map((x) => ObtainedItem.fromMap(x))),
      workSkills: List<WorkSkill>.from(map['workSkills'].map((x) => WorkSkill.fromMap(x))),
      activeSkills: List<PalActiveSkills>.from(map['activeSkills'].map((x) => PalActiveSkills.fromMap(x))),
      palPartnerSkills: List<PalPartnerSkills>.from(map['palPartnerSkills'].map((x) => PalPartnerSkills.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'palId': palId,
      'name': name,
      'imagePath': imagePath,
      'companionSkill': companionAbility,
      'foodQuantity': foodQuantity,
      'number': numero,
      'nickname': nickname,
      'size': size,
      'rarity': rarity,
      'hp': hp,
      'meleeAttack': meleeAttack,
      'magicAttack': magicAttack,
      'defense': defense,
      'support': support,
      'craftingSpeed': craftingSpeed,
      'captureRate': captureRate,
      'price': price,
      'slowWalkSpeed': slowWalkSpeed,
      'runSpeed': runSpeed,
      'sprintSpeed': sprintSpeed,
      'maleProbability': maleProbability,
      'elements': elementos.map((element) => element.toMap()).toList(),
      'obtainedItems': obtainedItems.map((item) => item.toMap()).toList(),
      'workSkills': workSkills.map((skill) => skill.toMap()).toList(),
      'activeSkills': activeSkills.map((skill) => skill.toMap()).toList(),
      'palPartnerSkills': palPartnerSkills.map((skill) => skill.toMap()).toList(),
    };
  }

  
}