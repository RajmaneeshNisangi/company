class NavItem {
  const NavItem({
    required this.label,
    required this.path,
    this.children = const [],
  });

  final String label;
  final String path;
  final List<NavItem> children;
}

const List<NavItem> aboutDropdownItems = [
  NavItem(label: 'Who We Are', path: '/about?section=who-we-are'),
  NavItem(
    label: 'What Sets Us Apart',
    path: '/about?section=what-sets-us-apart',
  ),
  NavItem(label: 'Leadership', path: '/about?section=leadership'),
  NavItem(label: 'Locations', path: '/about?section=locations'),
];

const List<NavItem> servicesDropdownItems = [
  NavItem(
    label: 'Custom Software Development',
    path: '/services?section=custom-software-development',
  ),
  NavItem(label: 'DevOps Engineering', path: '/services?section=devops'),
  NavItem(
    label: 'Cybersecurity Services',
    path: '/services?section=cybersecurity',
  ),
  NavItem(
    label: 'Data Engineering',
    path: '/services?section=data-engineering',
  ),
];

const List<NavItem> technologiesDropdownItems = [
  NavItem(label: 'Flutter & Web', path: '/technologies?section=flutter-web'),
  NavItem(label: 'Cloud Platforms', path: '/technologies?section=cloud'),
  NavItem(label: 'Data Platforms', path: '/technologies?section=data'),
  NavItem(label: 'AI Tooling', path: '/technologies?section=ai'),
];

const List<NavItem> industriesDropdownItems = [
  NavItem(label: 'Healthcare', path: '/industries?section=healthcare'),
  NavItem(label: 'Fintech', path: '/industries?section=fintech'),
  NavItem(label: 'Retail', path: '/industries?section=retail'),
  NavItem(label: 'Logistics', path: '/industries?section=logistics'),
];

const List<NavItem> talentDropdownItems = [
  NavItem(
    label: 'Staff Augmentation',
    path: '/talent?section=staff-augmentation',
  ),
  NavItem(label: 'Dedicated Teams', path: '/talent?section=dedicated-teams'),
  NavItem(
    label: 'Leadership Hiring',
    path: '/talent?section=leadership-hiring',
  ),
  NavItem(
    label: 'Flexible Engagements',
    path: '/talent?section=flexible-engagements',
  ),
];

const List<NavItem> resourcesDropdownItems = [
  NavItem(
    label: 'Cloud Migration Checklist',
    path: '/resources?section=cloud-migration',
  ),
  NavItem(
    label: 'Scaling Flutter for Enterprise',
    path: '/resources?section=scaling-flutter',
  ),
  NavItem(
    label: 'Building High-Velocity Teams',
    path: '/resources?section=high-velocity-teams',
  ),
  NavItem(
    label: 'AI Readiness Assessment',
    path: '/resources?section=ai-readiness',
  ),
];

const List<NavItem> careersDropdownItems = [
  NavItem(
    label: 'Senior Flutter Developer',
    path: '/careers?section=senior-flutter-developer',
  ),
  NavItem(label: 'DevOps Engineer', path: '/careers?section=devops-engineer'),
  NavItem(
    label: 'QA Automation Lead',
    path: '/careers?section=qa-automation-lead',
  ),
  NavItem(
    label: 'Technical Project Manager',
    path: '/careers?section=technical-project-manager',
  ),
];

const List<NavItem> mainNavItems = [
  NavItem(label: 'About', path: '/about', children: aboutDropdownItems),
  NavItem(
    label: 'Services',
    path: '/services',
    children: servicesDropdownItems,
  ),
  NavItem(
    label: 'Technologies',
    path: '/technologies',
    children: technologiesDropdownItems,
  ),
  NavItem(
    label: 'Industries',
    path: '/industries',
    children: industriesDropdownItems,
  ),
  NavItem(
    label: 'Talent Solutions',
    path: '/talent',
    children: talentDropdownItems,
  ),
  NavItem(
    label: 'Resources',
    path: '/resources',
    children: resourcesDropdownItems,
  ),
  NavItem(label: 'Careers', path: '/careers', children: careersDropdownItems),
];
