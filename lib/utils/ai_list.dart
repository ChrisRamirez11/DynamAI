class AILists {
  static const List<Map<String, String>> textToImage = [
    {
      'name': 'FlUX.1 Schnell',
      'endpoint': 'black-forest-labs/FLUX.1-schnell',
      'description': ''
    },
    {
      'name': 'FLUX.1 Dev',
      'endpoint': 'black-forest-labs/FLUX.1-dev',
      'description': ''
    },
    {
      'name': 'Stable Difussion',
      'endpoint': 'stabilityai/stable-diffusion-3.5-large',
      'description': ''
    },
  ];

  static const List<Map<String, String>> textToText = [
    {
      'name': 'Qwen',
      'endpoint': 'Qwen/Qwen2.5-72B-Instruct',
      'description': ''
    },
    {
      'name': 'Mixtral 8x7B',
      'endpoint': 'mistralai/Mixtral-8x7B-Instruct-v0.1',
      'description': ''
    },
    {
      'name': 'Mixtral 8x22B',
      'endpoint': 'mistralai/Mixtral-8x22B-Instruct-v0.1',
      'description': ''
    },
  ];

  static const List<Map<String, String>> textTranslator = [
    {'name': 'Google', 'endpoint': 'google-t5/t5-base', 'description': ''},
    {
      'name': 'Facebook',
      'endpoint': 'facebook/mbart-large-50-many-to-many-mmt',
      'description': ''
    },
  ];
}
