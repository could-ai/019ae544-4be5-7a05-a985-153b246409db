import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Control'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          // Navegación lateral para pantallas grandes (Web)
          if (MediaQuery.of(context).size.width > 800)
            NavigationRail(
              selectedIndex: 0,
              onDestinationSelected: (int index) {},
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Inicio'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.analytics_outlined),
                  selectedIcon: Icon(Icons.analytics),
                  label: Text('Análisis'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.smart_toy_outlined),
                  selectedIcon: Icon(Icons.smart_toy),
                  label: Text('IA'),
                ),
              ],
            ),
          if (MediaQuery.of(context).size.width > 800)
            const VerticalDivider(thickness: 1, width: 1),
          
          // Contenido principal
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildWelcomeCard(context),
                const SizedBox(height: 20),
                Text(
                  'Herramientas Inteligentes',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                _buildSmartGrid(context),
              ],
            ),
          ),
        ],
      ),
      // Barra de navegación inferior para móviles
      bottomNavigationBar: MediaQuery.of(context).size.width <= 800
          ? NavigationBar(
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  label: 'Inicio',
                ),
                NavigationDestination(
                  icon: Icon(Icons.analytics_outlined),
                  label: 'Análisis',
                ),
                NavigationDestination(
                  icon: Icon(Icons.smart_toy_outlined),
                  label: 'IA',
                ),
              ],
            )
          : null,
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola, Usuario',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tu sistema está sincronizado y listo. La IA ha detectado 3 nuevas oportunidades hoy.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmartGrid(BuildContext context) {
    // Grid responsivo
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;
    if (MediaQuery.of(context).size.width > 1100) crossAxisCount = 4;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildFeatureCard(
          context,
          icon: Icons.auto_graph,
          title: 'Predicciones',
          color: Colors.purple,
        ),
        _buildFeatureCard(
          context,
          icon: Icons.chat_bubble_outline,
          title: 'Chatbot IA',
          color: Colors.blue,
        ),
        _buildFeatureCard(
          context,
          icon: Icons.cloud_sync,
          title: 'Sincronización',
          color: Colors.orange,
        ),
        _buildFeatureCard(
          context,
          icon: Icons.settings_suggest,
          title: 'Automatización',
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon, required String title, required Color color}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
