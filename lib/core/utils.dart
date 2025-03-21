String normalizePhoneNumber(String phone) {
  return phone
      .replaceAll(RegExp(r'\D'), '') // Убираем все нецифровые символы
      .replaceFirst(RegExp(r'^8'), '7') // Заменяем 8 на 7 в начале
      .replaceFirst(RegExp(r'^7(?=[0-9]{10}$)'), '+7'); // Добавляем +7, если начинается с 7
}