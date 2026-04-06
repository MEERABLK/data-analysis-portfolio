-- phpMyAdmin SQL Dump
-- version 5.2.3-dev+20250818.dd3d8baef3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2026 at 07:37 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 8.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `claudellelaser_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` char(10) NOT NULL,
  `allergies` text NOT NULL,
  `join_date` date NOT NULL,
  `consent` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `first_name`, `last_name`, `email`, `phone`, `allergies`, `join_date`, `consent`) VALUES
(1, 'Ryan', 'Paulo', '', '5148989921', '', '2025-11-28', 1),
(2, 'Rosalie', 'Laplante', 'laplanteR90@gmail.com', '5146985540', 'Peau Sensible', '2024-01-15', 1),
(3, 'Ariyaratna', 'Wickramaratne', 'demersJul34@outlook.com', '', 'ALLERGIE AU POLLEN', '2025-12-13', 1),
(4, 'Lucas', 'Sinclair', '', '5146785545', 'cancer', '2025-12-01', 1),
(5, 'Jonathan', 'Byers', 'sinclairL@gmail.com', '', '', '2025-12-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_treatments`
--

CREATE TABLE `client_treatments` (
  `id` int(11) NOT NULL,
  `session_number` int(11) NOT NULL,
  `treatment_date` datetime NOT NULL,
  `notes` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_treatments`
--

INSERT INTO `client_treatments` (`id`, `session_number`, `treatment_date`, `notes`, `client_id`, `treatment_id`) VALUES
(21, 6, '2025-12-27 22:50:53', '. Il suffit de rajouter la tension de la machine a 3 de plus. Ensuite, 3 se plus tard je revoie ce client.', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `client_treatment_products`
--

CREATE TABLE `client_treatment_products` (
  `id` int(11) NOT NULL,
  `client_treatment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_treatment_products`
--

INSERT INTO `client_treatment_products` (`id`, `client_treatment_id`, `product_id`, `created_at`) VALUES
(56, 21, 3, '2025-12-30 13:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `treatment_id` int(11) DEFAULT NULL,
  `help_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `treatment_id`, `help_id`, `service_id`) VALUES
(1, 'Combien de séances me faudra-t-il?', 'La plupart des clients ont besoin de 3 à 4 séances pour des réultats optimaux. Le nombre exact varie selon le type de peau, la couleur et la zone traitée. ', NULL, NULL, 1),
(2, 'Comment ajouter un produit?', '1 - Allez dans la section Produit de l’application et cliquez sur le bouton +\r\n2 - Remplissez les informations du produit et clicker sur   Ajouter Produit.\r\n3 - Le nouveau produit apparaîtra maintenant dans la liste des produits.     ', NULL, 101, NULL),
(3, 'Comment rechercher rapidement un produit, service ou client?', '1 - Dans l’application, utilisez la barre de recherche en haut de la page dans la section correspondant au Service, Client ou Produit      \r\n2 - Tapez le nom ou un mot-clé lié au produit, service ou client que vous cherchez, même le nom du fournisseur.   \r\n3 - Pour affiner la recherche vous pouvez filtrer par catégorie.   ', NULL, 102, NULL),
(4, 'Comment modifier les informations du fournisseur?', '1. Cliquez sur le bouton fournisseur.\r\n2. Cliquez sur l\'icône en forme de crayon du fournisseur à modifier.\r\n3. La page de modification du fournisseur s\'affiche.\r\n4. Saisissez les informations mises à jour.\r\n5. Le fournisseur est mis à jour et ajouté à la base de données.\r\n', NULL, 103, NULL),
(5, 'Comment ajouter un client?', '1. Allez dans la section Client.\r\n2. Cliquez sur l\'icône en forme de crayon du client à modifier.\r\n3. La fenêtre modale « Modifier le produit » s\'affiche.\r\n4. Saisisez les informations mises à jour.\r\n5. Le client est mis à jour et ajouté à la base de données.', NULL, 104, NULL),
(6, 'Comment ajouter un fournisseur?', '1. Sur la page Fournisseurs\r\nL\'administrateur clique sur le bouton « + »\r\nLa page « Créer un fournisseur » s\'affiche\r\n4. L\'administrateur saisit les informations requises\r\n5. Le fournisseur est créé et ajouté à la base de données', NULL, 105, NULL),
(7, 'Quels effets secondaires ce traitement va-t-il me causer ?', 'La rougeur, gonflement de la peau, légères croûtes, et changements pigmentaires temporaires. Ces effets se vont se guérir en 1-2 semaines. Si ces symptômes s\'aggravent, veuillez consulter un médecin.', 1, NULL, NULL),
(8, 'Le traitement est-il douloureux?', 'Le niveau de confort varie selon la profondeur du laser. Pour les traitements légers, vous pouvez ressentir une sensation similaire au claquement d\'un élastique sur la peau.', 1, NULL, NULL),
(9, 'Quelles problèmes peut-il traiter?', 'Ce traitement cible principalement les rides et ridules, les cicatrices (d’acné ou chirurgicales), les taches pigmentaires et les dommages causés par le soleil.\r\nPour en savoir plus, veuillez consulter <a href=\'https://en.wikipedia.org/wiki/Photorejuvenation\'>https://en.wikipedia.org/wiki/Photorejuvenation</a>', 1, NULL, NULL),
(10, 'Votre nouvelle question ?', 'La réponse...', 2, NULL, NULL),
(11, 'Votre question ?', 'réponse...', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `faq_translations`
--

CREATE TABLE `faq_translations` (
  `id` int(11) NOT NULL,
  `faq_id` int(11) NOT NULL,
  `lang` char(2) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_translations`
--

INSERT INTO `faq_translations` (`id`, `faq_id`, `lang`, `question`, `answer`) VALUES
(1, 1, 'fr', 'Combien de séances me faudra-t-il?', 'La plupart des clients ont besoin de 3 à 4 séances pour des réultats optimaux. Le nombre exact varie selon le type de peau, la couleur et la zone traitée. '),
(2, 2, 'fr', 'Comment ajouter un produit?', '1 - Allez dans la section Produit de l’application et cliquez sur le bouton +\r\n2 - Remplissez les informations du produit et clicker sur   Ajouter Produit.\r\n3 - Le nouveau produit apparaîtra maintenant dans la liste des produits.     '),
(3, 3, 'fr', 'Comment rechercher rapidement un produit, service ou client?', '1 - Dans l’application, utilisez la barre de recherche en haut de la page dans la section correspondant au Service, Client ou Produit      \r\n2 - Tapez le nom ou un mot-clé lié au produit, service ou client que vous cherchez, même le nom du fournisseur.   \r\n3 - Pour affiner la recherche vous pouvez filtrer par catégorie.   '),
(4, 4, 'fr', 'Comment modifier les informations du fournisseur?', '1. Cliquez sur le bouton fournisseur.\r\n2. Cliquez sur l\'icône en forme de crayon du fournisseur à modifier.\r\n3. La page de modification du fournisseur s\'affiche.\r\n4. Saisissez les informations mises à jour.\r\n5. Le fournisseur est mis à jour et ajouté à la base de données.\r\n'),
(5, 5, 'fr', 'Comment ajouter un client?', '1. Allez dans la section Client.\r\n2. Cliquez sur l\'icône en forme de crayon du client à modifier.\r\n3. La fenêtre modale « Modifier le produit » s\'affiche.\r\n4. Saisisez les informations mises à jour.\r\n5. Le client est mis à jour et ajouté à la base de données.'),
(6, 6, 'fr', 'Comment ajouter un fournisseur?', '1. Sur la page Fournisseurs\r\nL\'administrateur clique sur le bouton « + »\r\nLa page « Créer un fournisseur » s\'affiche\r\n4. L\'administrateur saisit les informations requises\r\n5. Le fournisseur est créé et ajouté à la base de données'),
(7, 7, 'fr', 'Quels effets secondaires ce traitement va-t-il me causer ?', 'La rougeur, gonflement de la peau, légères croûtes, et changements pigmentaires temporaires. Ces effets se vont se guérir en 1-2 semaines. Si ces symptômes s\'aggravent, veuillez consulter un médecin.'),
(8, 8, 'fr', 'Le traitement est-il douloureux?', 'Le niveau de confort varie selon la profondeur du laser. Pour les traitements légers, vous pouvez ressentir une sensation similaire au claquement d\'un élastique sur la peau.'),
(9, 9, 'fr', 'Quelles problèmes peut-il traiter?', 'Ce traitement cible principalement les rides et ridules, les cicatrices (d’acné ou chirurgicales), les taches pigmentaires et les dommages causés par le soleil.\r\nPour en savoir plus, veuillez consulter <a href=\'https://en.wikipedia.org/wiki/Photorejuvenation\'>https://en.wikipedia.org/wiki/Photorejuvenation</a>'),
(10, 1, 'en', 'How many sessions will I need?', 'Most clients need 3 to 4 sessions for optimal results. The exact number varies depending on skin type, color, and treated area.'),
(11, 2, 'en', 'How to add a product?', '1 - Go to the Products section of the app and click the + button. \r\n2 - Fill in the product information and click Add Product. \r\n3 - The new product will now appear in the product list.'),
(12, 3, 'en', 'How to quickly search for a product, service, or client?', '1 - In the app, use the search bar at the top of the page in the corresponding section (Service, Client, or Product). \r\n2 - Type the name or keyword of the product, service, or client you are looking for. \r\n3 - To refine your search, you can filter by category.'),
(13, 4, 'en', 'How to edit supplier information?', '1 - Click the Supplier button. \r\n2 - Click the pencil icon for the supplier you want to edit. \r\n3 - The supplier edit page will appear. \r\n4 - Enter the updated information. \r\n5 - The supplier is updated in the database.'),
(14, 5, 'en', 'How to add a client?', '1 - Go to the Client section. \r\n2 - Click the pencil icon for the client you want to edit. \r\n3 - The “Edit Client” modal will appear. \r\n4 - Enter the updated information. \r\n5 - The client is updated in the database.'),
(15, 6, 'en', 'How to add a supplier?', '1 - On the Suppliers page, click the + button. \r\n2 - The “Create Supplier” page will appear. \r\n3 - Enter the required information. \r\n4 - The supplier is created and added to the database.'),
(16, 7, 'en', 'What side effects will this treatment cause?', 'Redness, skin swelling, mild crusts, and temporary pigmentation changes. These effects usually heal within 1-2 weeks. If symptoms worsen, consult a doctor.'),
(17, 8, 'en', 'Is the treatment painful?', 'Comfort level varies depending on the laser depth. For light treatments, you may feel a sensation similar to a rubber band snapping on the skin.'),
(18, 9, 'en', 'What issues can it treat?', 'This treatment mainly targets wrinkles, fine lines, scars (acne or surgical), pigmentation spots, and sun damage. \r\nFor more information, see <a href=\"https://en.wikipedia.org/wiki/Photorejuvenation\">https://en.wikipedia.org/wiki/Photorejuvenation</a>.'),
(19, 11, 'en', 'Your question?\r\n', 'Answer...\r\n'),
(20, 10, 'en', 'Your new question?\r\n', 'The answer...\r\n'),
(21, 11, 'fr', 'Votre question?', 'Reponse...');

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help`
--

INSERT INTO `help` (`id`) VALUES
(101),
(102),
(103),
(104),
(105);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$12$lT4NLAuTo1SmoFUzDaf/WOo39..o.boDrD0hiJactQgs49SANqRXy');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `media_type` char(5) NOT NULL,
  `media_path` varchar(255) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `treatment_id` int(11) DEFAULT NULL,
  `client_treatment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `media_type`, `media_path`, `service_id`, `treatment_id`, `client_treatment_id`) VALUES
(1, 'video', 'https://youtu.be/AcbpBlovwjQ?si=uH-7WQXAyFmLXMB4', NULL, NULL, NULL),
(2, 'photo', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.britannica.com%2F47%2F6847-004-7D668BB0%2FFlag-Brazil.jpg&f=1&nofb=1&ipt=cbfc292529ee0af4e4bcd18829c5098cbe4be8c3f3e3d54466d5a155d8cc2438', NULL, NULL, NULL),
(3, 'video', 'https://youtu.be/FSBJCD9-EHE?si=mfIxSnJHK6EIqAvI', NULL, NULL, NULL),
(4, 'video', 'https://youtu.be/FSBJCD9-EHE?si=mfIxSnJHK6EIqAvI', NULL, NULL, NULL),
(5, 'photo', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.britannica.com%2F47%2F6847-004-7D668BB0%2FFlag-Brazil.jpg&f=1&nofb=1&ipt=cbfc292529ee0af4e4bcd18829c5098cbe4be8c3f3e3d54466d5a155d8cc2438', NULL, NULL, NULL),
(72, 'video', 'svc_1_1766987914_783224dc07c4.mp4', 1, NULL, NULL),
(73, 'yt', 'https://www.youtube.com/watch?v=7apjhhiyNlg&list=PLIivsWgptefJDRumt-YBdeA1KC_bbnVSL', 1, NULL, NULL),
(74, 'yt', 'https://www.youtube.com/watch?v=sPtHpYPvAoo', 1, NULL, NULL),
(75, 'video', 'svc_2_1767053566_419a131d542f.mp4', 2, NULL, NULL),
(76, 'video', 'svc_1_1767053620_c783b4743fbc.mp4', 1, NULL, NULL),
(77, 'video', 'svc_4_1767056997_c2a70e04d50e.mp4', 4, NULL, NULL),
(78, 'video', 'svc_1_1767057037_f6c5c379a653.mp4', 1, NULL, NULL),
(83, 'video', 'svc_3_1767119473_45fbda907cfc.mp4', 3, NULL, NULL),
(84, 'video', 'svc_3_1767119476_b0b846f67b78.mp4', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Homecare','Professional') NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `treatment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `type`, `description`, `quantity`, `price`, `image`, `supplier_id`, `product_category_id`, `treatment_id`) VALUES
(2, 'Ampoule Impurity Control 21pcs, 5ml', 'Homecare', 'Un bon ampoule.', 1, 82.80, 'upload_695098b4af24f.jpg', 1, 1, 2),
(3, 'Calming Facial Foam 100ml', 'Professional', 'Ce produit offre un bon massage du visage.', 1, 12.00, 'upload_6950992d2082b.png', 1, 2, 2),
(4, 'Sérum Collagène', 'Professional', 'Sérum qui stimule la production de collagène', 4, 120.00, 'upload_6949e418a70d3.png', 5, 1, 4),
(5, 'Crème Anti-Âge', 'Professional', 'Crème hydratante et anti-rides', 4, 30.80, 'upload_6950990d71295.png', 2, 5, 3),
(6, 'Mela White Active C Serum 50ml', 'Professional', 'aaaa', 34, 129.99, 'upload_695098f79e41c.png', 3, 3, NULL),
(9, 'Vitamin4', 'Homecare', 'bon pour', 7, 110.00, 'upload_69541798cb9f9.png', 2, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `description`) VALUES
(1, 'Serum', 'Category for Serums.'),
(2, 'Cream', 'Category for creams.'),
(3, 'Lotion', 'Lotion pour le corps.'),
(4, 'Creme solaire', 'Offre une bonne protection contre le soleil.'),
(5, 'Crème pour bouton.', 'Une bonne crème pour réduire les boutons.');

-- --------------------------------------------------------

--
-- Table structure for table `product_treatments`
--

CREATE TABLE `product_treatments` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_treatments`
--

INSERT INTO `product_treatments` (`id`, `product_id`, `treatment_id`) VALUES
(2, 2, 5),
(3, 3, 4),
(4, 2, 3),
(5, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon_image` varchar(255) NOT NULL,
  `service_color` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `icon_image`, `service_color`) VALUES
(1, 'Rajeunissement de la peau', 'Nettoyage en profondeur et peeling exfoliant pour illuminer et lisser la peau', 'perfume-icon.png', 'orange'),
(2, 'Traitements de l’Acné', 'Réduction permanente des poils grâce à une technologie laser avancée', 'sun.png', 'magenta'),
(3, 'Soins du Visage', 'Nettoyage en profondeur, hydratation et peau éclatante avec l’Hydrafacial', 'flower.png', 'green'),
(4, 'Hyperpigmentation', 'Éclaircit les tâches foncées et unifie le teint', 'sun.png', 'pink'),
(5, 'Microneedling', 'Stimule le collagène, réduit les cicatrices et améliore la texture de la peau.', 'deux-brosse.png', 'lime');

-- --------------------------------------------------------

--
-- Table structure for table `service_translations`
--

CREATE TABLE `service_translations` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `lang` char(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_translations`
--

INSERT INTO `service_translations` (`id`, `service_id`, `lang`, `name`, `description`) VALUES
(1, 1, 'fr', 'Rajeunissement de la peau', 'Nettoyage en profondeur et peeling exfoliant pour illuminer et lisser la peau'),
(2, 2, 'fr', 'Traitements de l’Acné', 'Réduction permanente des poils grâce à une technologie laser avancée'),
(3, 3, 'fr', 'Soins du Visage', 'Nettoyage en profondeur, hydratation et peau éclatante avec l’Hydrafacial'),
(4, 4, 'fr', 'Hyperpigmentation', 'Éclaircit les tâches foncées et unifie le teint'),
(5, 5, 'fr', 'Microneedling', 'Stimule le collagène, réduit les cicatrices et améliore la texture de la peau.'),
(8, 1, 'en', 'Skin Rejuvenation\r\n', 'Deep cleansing and exfoliating peel to brighten and smooth the skin'),
(9, 2, 'en', 'Acne Treatments', 'Permanent hair reduction using advanced laser technology.'),
(10, 3, 'en', 'Facial Care', 'Deep cleansing, hydration, and radiant skin with Hydrafacial.'),
(11, 4, 'en', 'Hyperpigmentation', 'Lightens dark spots and evens skin tone.'),
(12, 5, 'en', 'Microneedling', 'Stimulates collagen, reduces scars, and improves skin texture.');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `website`) VALUES
(1, 'Euro Essentials', '4166616700', 'accounting@euro-essentials.com', 'accounting@euro-essentials.com'),
(2, 'DermGlow Supplies', '5141234567', '', 'www.dermglow.com'),
(3, 'SkinRevive Co.', '', 'info@skinrevive.ca', ''),
(4, 'BeautStimule', '4389876543', '', 'www.skinrevive.ca'),
(5, 'CollagenCare', '5148765432', 'support@collagencare.com', 'www.collagencare.com'),
(6, 'hkddeudheu', '5142738900', 'lowkeymischievous@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `duration` time NOT NULL,
  `required_sessions` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`id`, `name`, `description`, `duration`, `required_sessions`, `price`, `service_id`) VALUES
(1, 'Peeling Au Laser', 'Resurfaçage au laser pour le renouvellement de la peau. Redonnez éclat et uniformité à votre peau grâce à notre peeling au laser de pointe.', '00:30:00', 8, 120, 1),
(2, 'Peeling Chimique Moyen ', 'Exfoliation plus profonde pour une texture de peau améliorée', '00:45:00', 5, 250, 1),
(3, 'Peeling Chimique Léger ', 'Exfoliation superficielle pour une peau éclatante', '00:35:00', 5, 83, 1),
(4, 'Soin Collagène', 'Stimule la production de collagène, réduit les cicatrices et améliore la texture de la peau.', '00:30:00', 1, 183, 4),
(5, 'Thérapie Éclaircissante', 'Éclaircit les taches sombres et unifie le teint.', '00:28:39', 5, 250, 3);

-- --------------------------------------------------------

--
-- Table structure for table `treatment_translations`
--

CREATE TABLE `treatment_translations` (
  `id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `lang` char(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `treatment_translations`
--

INSERT INTO `treatment_translations` (`id`, `treatment_id`, `lang`, `name`, `description`) VALUES
(1, 1, 'fr', 'Peeling Au Laser', 'Resurfaçage au laser pour le renouvellement de la peau. Redonnez éclat et uniformité à votre peau grâce à notre peeling au laser de pointe.'),
(2, 2, 'fr', 'Peeling Chimique Moyen ', 'Exfoliation plus profonde pour une texture de peau améliorée'),
(3, 3, 'fr', 'Peeling Chimique Léger ', 'Exfoliation superficielle pour une peau éclatante'),
(4, 4, 'fr', 'Soin Collagène', 'Stimule la production de collagène, réduit les cicatrices et améliore la texture de la peau.'),
(5, 5, 'fr', 'Thérapie Éclaircissante', 'Éclaircit les taches sombres et unifie le teint.'),
(8, 1, 'en', 'Laser Peel', 'Laser resurfacing for skin renewal. Restore radiance and evenness to your skin with our advanced laser peel.'),
(9, 2, 'en', 'Medium Chemical Peel', 'Deeper exfoliation for improved skin texture.'),
(10, 3, 'en', 'Light Chemical Peel', 'Superficial exfoliation for glowing skin.'),
(11, 4, 'en', 'Collagen Treatment', 'Stimulates collagen production, reduces scars, and improves skin texture.'),
(12, 5, 'en', 'Brightening Therapy', 'Lightens dark spots and evens out skin tone.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_treatments`
--
ALTER TABLE `client_treatments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_treatments_client_id_fk` (`client_id`),
  ADD KEY `client_treatments_treatment_id_fk` (`treatment_id`);

--
-- Indexes for table `client_treatment_products`
--
ALTER TABLE `client_treatment_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_ctp` (`client_treatment_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_treatment_id_fk` (`treatment_id`),
  ADD KEY `faq_help_id_fk` (`help_id`),
  ADD KEY `faq_service_id_fk` (`service_id`);

--
-- Indexes for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faq_id` (`faq_id`,`lang`);

--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_uk` (`username`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_service_id_fk` (`service_id`),
  ADD KEY `media_treatment_id_fk` (`treatment_id`),
  ADD KEY `media_client_treatments_id_fk` (`client_treatment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_supplier_id_fk` (`supplier_id`),
  ADD KEY `products_product_category_id_fk` (`product_category_id`),
  ADD KEY `products_treatment_id_fk` (`treatment_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_treatments`
--
ALTER TABLE `product_treatments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_treatments_product_id_fk` (`product_id`),
  ADD KEY `product_treatments_treatment_id_fk` (`treatment_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_id` (`service_id`,`lang`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `treatments_service_id_fk` (`service_id`);

--
-- Indexes for table `treatment_translations`
--
ALTER TABLE `treatment_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `treatment_id` (`treatment_id`,`lang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `client_treatments`
--
ALTER TABLE `client_treatments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `client_treatment_products`
--
ALTER TABLE `client_treatment_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `faq_translations`
--
ALTER TABLE `faq_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `help`
--
ALTER TABLE `help`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_treatments`
--
ALTER TABLE `product_treatments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service_translations`
--
ALTER TABLE `service_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `treatment_translations`
--
ALTER TABLE `treatment_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_treatments`
--
ALTER TABLE `client_treatments`
  ADD CONSTRAINT `client_treatments_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `client_treatments_treatment_id_fk` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`id`);

--
-- Constraints for table `client_treatment_products`
--
ALTER TABLE `client_treatment_products`
  ADD CONSTRAINT `client_treatment_products_ibfk_1` FOREIGN KEY (`client_treatment_id`) REFERENCES `client_treatments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `client_treatment_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_help_id_fk` FOREIGN KEY (`help_id`) REFERENCES `help` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `faq_service_id_fk` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `faq_treatment_id_fk` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD CONSTRAINT `faq_translations_ibfk_1` FOREIGN KEY (`faq_id`) REFERENCES `faq` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_client_treatments_id_fk` FOREIGN KEY (`client_treatment_id`) REFERENCES `client_treatments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `media_service_id_fk` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `media_treatment_id_fk` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_product_category_id_fk` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`),
  ADD CONSTRAINT `products_supplier_id_fk` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `products_treatment_id_fk` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`id`);

--
-- Constraints for table `product_treatments`
--
ALTER TABLE `product_treatments`
  ADD CONSTRAINT `product_treatments_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_treatments_treatment_id_fk` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`id`);

--
-- Constraints for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD CONSTRAINT `service_translations_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `treatments`
--
ALTER TABLE `treatments`
  ADD CONSTRAINT `treatments_service_id_fk` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `treatment_translations`
--
ALTER TABLE `treatment_translations`
  ADD CONSTRAINT `treatment_translations_ibfk_1` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
