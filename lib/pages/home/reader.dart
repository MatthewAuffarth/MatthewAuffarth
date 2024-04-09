import "package:app1/functions/clickable_text.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
void signUserOut(){
  FirebaseAuth.instance.signOut();
}


@override
Widget build(BuildContext context) 
{

  const String read = ''' Por supuesto, aquí tienes un texto aún más extenso en español:En el vasto y diverso territorio de América Latina, se despliega un tapiz cultural ricamente tejido con las historias, tradiciones y paisajes de sus pueblos. Desde las exuberantes selvas amazónicas hasta las áridas llanuras del altiplano, desde las bulliciosas metrópolis hasta los remotos pueblos de montaña, cada rincón del continente respira vida y color.
  En las calles empedradas de los cascos históricos, se entreteje el pasado colonial con la modernidad del presente. Las antiguas iglesias de estilo barroco y las plazas adoquinadas son testigos mudos de siglos de historia y cultura, mientras que los cafés y restaurantes atraen a lugareños y turistas por igual con su gastronomía exquisita y su ambiente acogedor.

  En las playas de aguas cristalinas, el rumor del mar se mezcla con el ritmo alegre de la música y el baile. Desde el tango apasionado de Argentina hasta la samba vibrante de Brasil, la música es el latido del corazón de América Latina, uniendo a sus habitantes en celebración y camaradería.

  En las montañas de los Andes, se alzan imponentes las ruinas de antiguas civilizaciones precolombinas. Los misteriosos restos arqueológicos de Machu Picchu en Perú, las pirámides de Teotihuacán en México y las esculturas de piedra de la Isla de Pascua en Chile son testigos de la grandeza y el ingenio de los pueblos que los construyeron.

  En las selvas tropicales, la biodiversidad alcanza su máximo esplendor. Las aves exóticas revolotean entre los árboles centenarios, los monos aulladores braman desde lo alto y las coloridas mariposas danzan entre las flores. Cada rincón de la selva es un santuario de vida, un recordatorio de la importancia de conservar y proteger los ecosistemas naturales.

  En los campos de cultivo y las plantaciones, se cosechan los frutos de la tierra con esfuerzo y dedicación. El cacao, el café, el maíz y el arroz son solo algunos de los productos que sustentan la vida y la economía de la región, proporcionando sustento a millones de personas y generando riqueza y prosperidad para las comunidades.

  En los mercados y ferias, se despliega un festín para los sentidos. Los puestos rebosantes de frutas frescas, verduras coloridas, especias aromáticas y artesanías únicas invitan a los visitantes a explorar y descubrir los sabores y aromas de la tierra.

  En las plazas y parques, se congrega la gente para celebrar la vida y la cultura. Los festivales de música, danza y comida son ocasiones para reunirse con amigos y familiares, compartir risas y crear recuerdos inolvidables que perdurarán para siempre en el corazón de quienes participan en ellos.

  En resumen, América Latina es un continente vibrante y diverso, lleno de vida, color y tradición. Su riqueza cultural, su belleza natural y su espíritu acogedor lo convierten en un destino único y fascinante que cautiva a quienes tienen la suerte de explorarlo y conocerlo.''';
    

  return Scaffold
  (
      appBar: AppBar
      (
        actions: 
        [
        IconButton(
          onPressed: signUserOut, 
          icon: const Icon(Icons.logout),
          )
        ],
      ),
      
      body: const ClickableText(text: read,)

  );
}
}