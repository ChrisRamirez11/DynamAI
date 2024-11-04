class AILists {
  static const List<Map<String, String>> textToImage = [
    {
      'name': 'FLUX.1 Schnell',
      'endpoint': 'black-forest-labs/FLUX.1-schnell',
      'description': 'A fast and lower version of this awesome AI by Black Forest'
    },
    {
      'name': 'FLUX.1 Dev',
      'endpoint': 'black-forest-labs/FLUX.1-dev',
      'description': 'A slower but so much better version than FLUX.1 Schnell'
    },
    {
      'name': 'Stable Difussion',
      'endpoint': 'stabilityai/stable-diffusion-3.5-large',
      'description': 'A image generative AI, stable and with good resuts'
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
    {
      'name': 'Facebook',
      'endpoint': 'facebook/mbart-large-50-many-to-many-mmt',
      'description': ''
    },
  ];
}
