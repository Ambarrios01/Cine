-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-05-2025 a las 16:36:14
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Cine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos`
--

CREATE TABLE `asientos` (
  `id_asiento` int(11) NOT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `fila` char(1) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asientos`
--

INSERT INTO `asientos` (`id_asiento`, `id_sala`, `fila`, `numero`) VALUES
(1503, 6, 'A', 1),
(1504, 6, 'A', 2),
(1505, 6, 'A', 3),
(1506, 6, 'A', 4),
(1507, 6, 'A', 5),
(1508, 6, 'A', 6),
(1509, 6, 'A', 7),
(1510, 6, 'A', 8),
(1511, 6, 'A', 9),
(1512, 6, 'A', 10),
(1513, 6, 'A', 11),
(1514, 6, 'A', 12),
(1515, 6, 'A', 13),
(1516, 6, 'A', 14),
(1517, 6, 'A', 15),
(1518, 6, 'B', 1),
(1519, 6, 'B', 2),
(1520, 6, 'B', 3),
(1521, 6, 'B', 4),
(1522, 6, 'B', 5),
(1523, 6, 'B', 6),
(1524, 6, 'B', 7),
(1525, 6, 'B', 8),
(1526, 6, 'B', 9),
(1527, 6, 'B', 10),
(1528, 6, 'B', 11),
(1529, 6, 'B', 12),
(1530, 6, 'B', 13),
(1531, 6, 'B', 14),
(1532, 6, 'B', 15),
(1533, 6, 'C', 1),
(1534, 6, 'C', 2),
(1535, 6, 'C', 3),
(1536, 6, 'C', 4),
(1537, 6, 'C', 5),
(1538, 6, 'C', 6),
(1539, 6, 'C', 7),
(1540, 6, 'C', 8),
(1541, 6, 'C', 9),
(1542, 6, 'C', 10),
(1543, 6, 'C', 11),
(1544, 6, 'C', 12),
(1545, 6, 'C', 13),
(1546, 6, 'C', 14),
(1547, 6, 'C', 15),
(1548, 6, 'D', 1),
(1549, 6, 'D', 2),
(1550, 6, 'D', 3),
(1551, 6, 'D', 4),
(1552, 6, 'D', 5),
(1553, 6, 'D', 6),
(1554, 6, 'D', 7),
(1555, 6, 'D', 8),
(1556, 6, 'D', 9),
(1557, 6, 'D', 10),
(1558, 6, 'D', 11),
(1559, 6, 'D', 12),
(1560, 6, 'D', 13),
(1561, 6, 'D', 14),
(1562, 6, 'D', 15),
(1563, 6, 'E', 1),
(1564, 6, 'E', 2),
(1565, 6, 'E', 3),
(1566, 6, 'E', 4),
(1567, 6, 'E', 5),
(1568, 6, 'E', 6),
(1569, 6, 'E', 7),
(1570, 6, 'E', 8),
(1571, 6, 'E', 9),
(1572, 6, 'E', 10),
(1573, 6, 'E', 11),
(1574, 6, 'E', 12),
(1575, 6, 'E', 13),
(1576, 6, 'E', 14),
(1577, 6, 'E', 15),
(1578, 6, 'F', 1),
(1579, 6, 'F', 2),
(1580, 6, 'F', 3),
(1581, 6, 'F', 4),
(1582, 6, 'F', 5),
(1583, 6, 'F', 6),
(1584, 6, 'F', 7),
(1585, 6, 'F', 8),
(1586, 6, 'F', 9),
(1587, 6, 'F', 10),
(1588, 6, 'F', 11),
(1589, 6, 'F', 12),
(1590, 6, 'F', 13),
(1591, 6, 'F', 14),
(1592, 6, 'F', 15),
(1593, 6, 'G', 1),
(1594, 6, 'G', 2),
(1595, 6, 'G', 3),
(1596, 6, 'G', 4),
(1597, 6, 'G', 5),
(1598, 6, 'G', 6),
(1599, 6, 'G', 7),
(1600, 6, 'G', 8),
(1601, 6, 'G', 9),
(1602, 6, 'G', 10),
(1603, 6, 'G', 11),
(1604, 6, 'G', 12),
(1605, 6, 'G', 13),
(1606, 6, 'G', 14),
(1607, 6, 'G', 15),
(1608, 7, 'A', 1),
(1609, 7, 'A', 2),
(1610, 7, 'A', 3),
(1611, 7, 'A', 4),
(1612, 7, 'A', 5),
(1613, 7, 'A', 6),
(1614, 7, 'A', 7),
(1615, 7, 'A', 8),
(1616, 7, 'A', 9),
(1617, 7, 'A', 10),
(1618, 7, 'A', 11),
(1619, 7, 'A', 12),
(1620, 7, 'A', 13),
(1621, 7, 'A', 14),
(1622, 7, 'A', 15),
(1623, 7, 'B', 1),
(1624, 7, 'B', 2),
(1625, 7, 'B', 3),
(1626, 7, 'B', 4),
(1627, 7, 'B', 5),
(1628, 7, 'B', 6),
(1629, 7, 'B', 7),
(1630, 7, 'B', 8),
(1631, 7, 'B', 9),
(1632, 7, 'B', 10),
(1633, 7, 'B', 11),
(1634, 7, 'B', 12),
(1635, 7, 'B', 13),
(1636, 7, 'B', 14),
(1637, 7, 'B', 15),
(1638, 7, 'C', 1),
(1639, 7, 'C', 2),
(1640, 7, 'C', 3),
(1641, 7, 'C', 4),
(1642, 7, 'C', 5),
(1643, 7, 'C', 6),
(1644, 7, 'C', 7),
(1645, 7, 'C', 8),
(1646, 7, 'C', 9),
(1647, 7, 'C', 10),
(1648, 7, 'C', 11),
(1649, 7, 'C', 12),
(1650, 7, 'C', 13),
(1651, 7, 'C', 14),
(1652, 7, 'C', 15),
(1653, 7, 'D', 1),
(1654, 7, 'D', 2),
(1655, 7, 'D', 3),
(1656, 7, 'D', 4),
(1657, 7, 'D', 5),
(1658, 7, 'D', 6),
(1659, 7, 'D', 7),
(1660, 7, 'D', 8),
(1661, 7, 'D', 9),
(1662, 7, 'D', 10),
(1663, 7, 'D', 11),
(1664, 7, 'D', 12),
(1665, 7, 'D', 13),
(1666, 7, 'D', 14),
(1667, 7, 'D', 15),
(1668, 7, 'E', 1),
(1669, 7, 'E', 2),
(1670, 7, 'E', 3),
(1671, 7, 'E', 4),
(1672, 7, 'E', 5),
(1673, 7, 'E', 6),
(1674, 7, 'E', 7),
(1675, 7, 'E', 8),
(1676, 7, 'E', 9),
(1677, 7, 'E', 10),
(1678, 7, 'E', 11),
(1679, 7, 'E', 12),
(1680, 7, 'E', 13),
(1681, 7, 'E', 14),
(1682, 7, 'E', 15),
(1683, 7, 'F', 1),
(1684, 7, 'F', 2),
(1685, 7, 'F', 3),
(1686, 7, 'F', 4),
(1687, 7, 'F', 5),
(1688, 7, 'F', 6),
(1689, 7, 'F', 7),
(1690, 7, 'F', 8),
(1691, 7, 'F', 9),
(1692, 7, 'F', 10),
(1693, 7, 'F', 11),
(1694, 7, 'F', 12),
(1695, 7, 'F', 13),
(1696, 7, 'F', 14),
(1697, 7, 'F', 15),
(1698, 7, 'G', 1),
(1699, 7, 'G', 2),
(1700, 7, 'G', 3),
(1701, 7, 'G', 4),
(1702, 7, 'G', 5),
(1703, 7, 'G', 6),
(1704, 7, 'G', 7),
(1705, 7, 'G', 8),
(1706, 7, 'G', 9),
(1707, 7, 'G', 10),
(1708, 7, 'G', 11),
(1709, 7, 'G', 12),
(1710, 7, 'G', 13),
(1711, 7, 'G', 14),
(1712, 7, 'G', 15),
(1713, 7, 'H', 1),
(1714, 7, 'H', 2),
(1715, 7, 'H', 3),
(1716, 7, 'H', 4),
(1717, 7, 'H', 5),
(1718, 7, 'H', 6),
(1719, 7, 'H', 7),
(1720, 7, 'H', 8),
(1721, 7, 'H', 9),
(1722, 7, 'H', 10),
(1723, 7, 'H', 11),
(1724, 7, 'H', 12),
(1725, 7, 'H', 13),
(1726, 7, 'H', 14),
(1727, 7, 'H', 15),
(1728, 7, 'I', 1),
(1729, 7, 'I', 2),
(1730, 7, 'I', 3),
(1731, 7, 'I', 4),
(1732, 7, 'I', 5),
(1733, 7, 'I', 6),
(1734, 7, 'I', 7),
(1735, 7, 'I', 8),
(1736, 7, 'I', 9),
(1737, 7, 'I', 10),
(1738, 7, 'I', 11),
(1739, 7, 'I', 12),
(1740, 7, 'I', 13),
(1741, 7, 'I', 14),
(1742, 7, 'I', 15),
(1743, 7, 'J', 1),
(1744, 7, 'J', 2),
(1745, 7, 'J', 3),
(1746, 7, 'J', 4),
(1747, 7, 'J', 5),
(1748, 7, 'J', 6),
(1749, 7, 'J', 7),
(1750, 7, 'J', 8),
(1751, 7, 'J', 9),
(1752, 7, 'J', 10),
(1753, 7, 'J', 11),
(1754, 7, 'J', 12),
(1755, 7, 'J', 13),
(1756, 7, 'J', 14),
(1757, 7, 'J', 15),
(1758, 8, 'A', 1),
(1759, 8, 'A', 2),
(1760, 8, 'A', 3),
(1761, 8, 'A', 4),
(1762, 8, 'A', 5),
(1763, 8, 'A', 6),
(1764, 8, 'A', 7),
(1765, 8, 'A', 8),
(1766, 8, 'A', 9),
(1767, 8, 'A', 10),
(1768, 8, 'A', 11),
(1769, 8, 'A', 12),
(1770, 8, 'A', 13),
(1771, 8, 'A', 14),
(1772, 8, 'A', 15),
(1773, 8, 'B', 1),
(1774, 8, 'B', 2),
(1775, 8, 'B', 3),
(1776, 8, 'B', 4),
(1777, 8, 'B', 5),
(1778, 8, 'B', 6),
(1779, 8, 'B', 7),
(1780, 8, 'B', 8),
(1781, 8, 'B', 9),
(1782, 8, 'B', 10),
(1783, 8, 'B', 11),
(1784, 8, 'B', 12),
(1785, 8, 'B', 13),
(1786, 8, 'B', 14),
(1787, 8, 'B', 15),
(1788, 8, 'C', 1),
(1789, 8, 'C', 2),
(1790, 8, 'C', 3),
(1791, 8, 'C', 4),
(1792, 8, 'C', 5),
(1793, 8, 'C', 6),
(1794, 8, 'C', 7),
(1795, 8, 'C', 8),
(1796, 8, 'C', 9),
(1797, 8, 'C', 10),
(1798, 8, 'C', 11),
(1799, 8, 'C', 12),
(1800, 8, 'C', 13),
(1801, 8, 'C', 14),
(1802, 8, 'C', 15),
(1803, 8, 'D', 1),
(1804, 8, 'D', 2),
(1805, 8, 'D', 3),
(1806, 8, 'D', 4),
(1807, 8, 'D', 5),
(1808, 8, 'D', 6),
(1809, 8, 'D', 7),
(1810, 8, 'D', 8),
(1811, 8, 'D', 9),
(1812, 8, 'D', 10),
(1813, 8, 'D', 11),
(1814, 8, 'D', 12),
(1815, 8, 'D', 13),
(1816, 8, 'D', 14),
(1817, 8, 'D', 15),
(1818, 8, 'E', 1),
(1819, 8, 'E', 2),
(1820, 8, 'E', 3),
(1821, 8, 'E', 4),
(1822, 8, 'E', 5),
(1823, 8, 'E', 6),
(1824, 8, 'E', 7),
(1825, 8, 'E', 8),
(1826, 8, 'E', 9),
(1827, 8, 'E', 10),
(1828, 8, 'E', 11),
(1829, 8, 'E', 12),
(1830, 8, 'E', 13),
(1831, 8, 'E', 14),
(1832, 8, 'E', 15),
(1833, 8, 'F', 1),
(1834, 8, 'F', 2),
(1835, 8, 'F', 3),
(1836, 8, 'F', 4),
(1837, 8, 'F', 5),
(1838, 8, 'F', 6),
(1839, 8, 'F', 7),
(1840, 8, 'F', 8),
(1841, 8, 'F', 9),
(1842, 8, 'F', 10),
(1843, 8, 'F', 11),
(1844, 8, 'F', 12),
(1845, 8, 'F', 13),
(1846, 8, 'F', 14),
(1847, 8, 'F', 15),
(1848, 8, 'G', 1),
(1849, 8, 'G', 2),
(1850, 8, 'G', 3),
(1851, 8, 'G', 4),
(1852, 8, 'G', 5),
(1853, 8, 'G', 6),
(1854, 8, 'G', 7),
(1855, 8, 'G', 8),
(1856, 8, 'G', 9),
(1857, 8, 'G', 10),
(1858, 8, 'G', 11),
(1859, 8, 'G', 12),
(1860, 8, 'G', 13),
(1861, 8, 'G', 14),
(1862, 8, 'G', 15),
(1863, 8, 'H', 1),
(1864, 8, 'H', 2),
(1865, 8, 'H', 3),
(1866, 8, 'H', 4),
(1867, 8, 'H', 5),
(1868, 8, 'H', 6),
(1869, 8, 'H', 7),
(1870, 8, 'H', 8),
(1871, 8, 'H', 9),
(1872, 8, 'H', 10),
(1873, 8, 'H', 11),
(1874, 8, 'H', 12),
(1875, 8, 'H', 13),
(1876, 8, 'H', 14),
(1877, 8, 'H', 15),
(1878, 8, 'I', 1),
(1879, 8, 'I', 2),
(1880, 8, 'I', 3),
(1881, 8, 'I', 4),
(1882, 8, 'I', 5),
(1883, 8, 'I', 6),
(1884, 8, 'I', 7),
(1885, 8, 'I', 8),
(1886, 8, 'I', 9),
(1887, 8, 'I', 10),
(1888, 8, 'I', 11),
(1889, 8, 'I', 12),
(1890, 8, 'I', 13),
(1891, 8, 'I', 14),
(1892, 8, 'I', 15),
(1893, 8, 'J', 1),
(1894, 8, 'J', 2),
(1895, 8, 'J', 3),
(1896, 8, 'J', 4),
(1897, 8, 'J', 5),
(1898, 8, 'J', 6),
(1899, 8, 'J', 7),
(1900, 8, 'J', 8),
(1901, 8, 'J', 9),
(1902, 8, 'J', 10),
(1903, 8, 'J', 11),
(1904, 8, 'J', 12),
(1905, 8, 'J', 13),
(1906, 8, 'J', 14),
(1907, 8, 'J', 15),
(1908, 8, 'K', 1),
(1909, 8, 'K', 2),
(1910, 8, 'K', 3),
(1911, 8, 'K', 4),
(1912, 8, 'K', 5),
(1913, 8, 'K', 6),
(1914, 8, 'K', 7),
(1915, 8, 'K', 8),
(1916, 8, 'K', 9),
(1917, 8, 'K', 10),
(1918, 8, 'K', 11),
(1919, 8, 'K', 12),
(1920, 8, 'K', 13),
(1921, 8, 'K', 14),
(1922, 8, 'K', 15),
(1923, 8, 'L', 1),
(1924, 8, 'L', 2),
(1925, 8, 'L', 3),
(1926, 8, 'L', 4),
(1927, 8, 'L', 5),
(1928, 8, 'L', 6),
(1929, 8, 'L', 7),
(1930, 8, 'L', 8),
(1931, 8, 'L', 9),
(1932, 8, 'L', 10),
(1933, 8, 'L', 11),
(1934, 8, 'L', 12),
(1935, 8, 'L', 13),
(1936, 8, 'L', 14),
(1937, 8, 'L', 15),
(1938, 8, 'M', 1),
(1939, 8, 'M', 2),
(1940, 8, 'M', 3),
(1941, 8, 'M', 4),
(1942, 8, 'M', 5),
(1943, 8, 'M', 6),
(1944, 8, 'M', 7),
(1945, 8, 'M', 8),
(1946, 8, 'M', 9),
(1947, 8, 'M', 10),
(1948, 8, 'M', 11),
(1949, 8, 'M', 12),
(1950, 8, 'M', 13),
(1951, 8, 'M', 14),
(1952, 8, 'M', 15),
(1953, 8, 'N', 1),
(1954, 8, 'N', 2),
(1955, 8, 'N', 3),
(1956, 8, 'N', 4),
(1957, 8, 'N', 5),
(1958, 8, 'N', 6),
(1959, 8, 'N', 7),
(1960, 8, 'N', 8),
(1961, 8, 'N', 9),
(1962, 8, 'N', 10),
(1963, 8, 'N', 11),
(1964, 8, 'N', 12),
(1965, 8, 'N', 13),
(1966, 8, 'N', 14),
(1967, 8, 'N', 15),
(1968, 8, 'O', 1),
(1969, 8, 'O', 2),
(1970, 8, 'O', 3),
(1971, 8, 'O', 4),
(1972, 8, 'O', 5),
(1973, 8, 'O', 6),
(1974, 8, 'O', 7),
(1975, 8, 'O', 8),
(1976, 8, 'O', 9),
(1977, 8, 'O', 10),
(1978, 8, 'O', 11),
(1979, 8, 'O', 12),
(1980, 8, 'O', 13),
(1981, 8, 'O', 14),
(1982, 8, 'O', 15),
(1983, 8, 'P', 1),
(1984, 8, 'P', 2),
(1985, 8, 'P', 3),
(1986, 8, 'P', 4),
(1987, 8, 'P', 5),
(1988, 8, 'P', 6),
(1989, 8, 'P', 7),
(1990, 8, 'P', 8),
(1991, 8, 'P', 9),
(1992, 8, 'P', 10),
(1993, 8, 'P', 11),
(1994, 8, 'P', 12),
(1995, 8, 'P', 13),
(1996, 8, 'P', 14),
(1997, 8, 'P', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletos`
--

CREATE TABLE `boletos` (
  `id_boleto` int(11) NOT NULL,
  `id_funcion` int(11) DEFAULT NULL,
  `id_asiento` int(11) DEFAULT NULL,
  `comprador` varchar(255) DEFAULT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confiteria`
--

CREATE TABLE `confiteria` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(6,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `imagen_confiteria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `confiteria`
--

INSERT INTO `confiteria` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `imagen_confiteria`) VALUES
(7, 'Combo Doble Sabor', 'Disfruta de la mejor combinación con nuestro Combo Doble Sabor: dos jugosas hamburguesas acompañadas de crujientes papas fritas y una refrescante gaseosa para completar la experiencia. Ideal para compartir o disfrutar de un festín por ti mismo. ¡Un combo irresistible para satisfacer tu hambre con el máximo sabor!', 25.00, 50, 'uploads/comb2.png'),
(8, 'Pizza Queso', 'Una deliciosa pizza clásica cubierta con abundante queso mozzarella fundido sobre una base de salsa de tomate casera. Perfecta para los amantes del sabor tradicional y el queso derretido.', 20.00, 20, 'uploads/Pizza_Queso.avif'),
(9, 'Pizza Salami', 'Una explosión de sabor con finas lonjas de salami sobre queso mozzarella y nuestra salsa especial de tomate. Ideal para quienes disfrutan de un toque más intenso y sabroso.', 25.00, 13, 'uploads/Pizza_salami.avif'),
(10, 'Pizza Especial', 'Una combinación única de ingredientes: jamón, salami, champiñones, pimientos y aceitunas negras, todo sobre una generosa capa de queso mozzarella. La opción perfecta para los que quieren probarlo todo en una sola pizza.', 30.00, 45, 'uploads/pizza_especial.jpg'),
(11, 'Hamburguesa de Pollo', 'Jugosa pechuga de pollo empanizada o a la plancha (según tu elección), servida en pan artesanal con lechuga fresca, tomate, queso derretido y nuestra salsa especial. Una opción ligera pero llena de sabor.', 20.00, 54, 'uploads/HambCarne.avif'),
(12, 'Hamburguesa de Carne', 'Clásica y sabrosa: carne 100% de res a la parrilla, acompañada de queso, lechuga, tomate, cebolla y pepinillos, todo dentro de un pan suave y tostado. El sabor tradicional que nunca falla.', 20.00, 76, 'uploads/hambCarne2.avif'),
(13, 'Nachos con Carne', 'Crujientes totopos bañados en queso derretido, acompañados de jugosa carne sazonada, jalapeños, guacamole, crema y pico de gallo. ¡Un clásico irresistible con mucho sabor!', 23.00, 43, 'uploads/NachosCarne.avif'),
(14, 'Nachos con Pollo', 'Totopos dorados cubiertos con queso fundido y trozos de pollo a la parrilla, coronados con guacamole, crema, jalapeños y pico de gallo. Una opción deliciosa y ligera para compartir (¡o no!).', 22.00, 54, 'uploads/Nacho_pollo.avif');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_factura` varchar(20) DEFAULT NULL,
  `estado` enum('Emitida','Anulada','Pagada') DEFAULT 'Emitida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `id_funcion` int(11) NOT NULL,
  `id_pelicula` int(11) DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `horario` datetime DEFAULT NULL,
  `precio` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`id_funcion`, `id_pelicula`, `id_sala`, `horario`, `precio`) VALUES
(7, 4, 6, '2025-04-30 15:04:00', 15.00),
(8, 4, 7, '2025-03-31 16:03:00', 15.00),
(9, 4, 8, '2025-03-30 13:00:00', 20.00),
(10, 4, 7, '2025-04-25 15:04:00', 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_facturas`
--

CREATE TABLE `historial_facturas` (
  `id_historial` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `accion` enum('Creada','Modificada','Anulada') NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id_metodo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_metodo` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Pendiente','Completado','Cancelado') DEFAULT 'Pendiente',
  `impuesto` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id_pelicula` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `duracion` int(11) NOT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `clasificacion` varchar(50) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `reparto` text DEFAULT NULL,
  `idioma` varchar(50) DEFAULT NULL,
  `estado` enum('Cartelera','Próximamente','Finalizada') DEFAULT 'Cartelera',
  `imagen_cartelera` varchar(255) DEFAULT NULL,
  `video_pelicula` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id_pelicula`, `titulo`, `duracion`, `genero`, `clasificacion`, `sinopsis`, `director`, `reparto`, `idioma`, `estado`, `imagen_cartelera`, `video_pelicula`) VALUES
(4, 'El Rescate Imposible', 118, 'Acción, Suspenso', 'R', 'Un equipo de élite se une para rescatar a rehenes en una misión de alto riesgo en territorio enemigo.', 'Raúl Gómez', 'Javier Torres, Lucía Martínez, Andrés Fuentes', 'Ingles', 'Cartelera', 'static/uploads/El_Rescate_Imposible._V1_.jpg', 'https://www.youtube.com/watch?v=n4roL2Iqyl8'),
(5, 'Snow White', 109, 'Animación, Familiar, Fantasia', 'Para todo el Público', 'Una adaptación en vivo del clásico cuento de hadas sobre una hermosa joven princesa que, mientras es acosada por una reina celosa, busca refugio en la casa de siete enanos en la campiña alemana.', 'Marc Webb', 'Rachel Zegler, Gal Gadot, Patrick Page, Andrew Burnap, Ansu Kabia', 'Inglés, Alemán', 'Cartelera', 'static/uploads/Snow_White.jpg', 'https://www.youtube.com/watch?v=iV46TJKL8cU'),
(6, 'Black Bag', 93, 'Drama, Suspenso', 'Recomendada para Mayores de 12 años', 'Del director Steven Soderbergh, Código negro es un apasionante drama de espionaje sobre el legendario agente de inteligencia George Woodhouse y su amada esposa Kathryn. Cuando ella es sospechosa de traicionar a la nación, George se enfrenta a la prueba definitiva: la lealtad a su matrimonio o a su país.', 'Steven Soderbergh', 'Cate Blanchett, Michael Fassbender, Marisa Abela, Tom Burke, Naomie Harris, Regé-​​​Jean Page, Pierce Brosnan', 'Inglés', 'Cartelera', 'static/uploads/Black_Bag.jpg', 'https://www.youtube.com/watch?v=Du0Xp8WX_7I'),
(7, 'Flow', 83, 'Animación, Aventura, Fantasia', 'Para todo el Público', 'El mundo parece estar llegando a su fin, repleto de vestigios de presencia humana. Gato es un animal solitario, pero como su hogar es arrasado por una gran inundación, encuentra refugio en un barco poblado por varias especies y tendrá que hacer equipo con ellas a pesar de sus diferencias. En el solitario barco que navega a través de místicos paisajes desbordantes, navegan por los desafíos y peligros de adaptarse a este nuevo mundo.', 'Gints Zilbalodis', 'N/A', 'Belgium, France, Latvia', 'Cartelera', 'static/uploads/Flow.webp', 'https://www.youtube.com/watch?v=l5zSgSuIDU4'),
(8, 'Kayara', 90, 'Animación, Aventura', 'Para todo el Público', 'Una joven inca sueña con unirse al grupo de mensajeros Chasqui, compuesto exclusivamente por hombres. Desafía las tradiciones y las normas de género para perseguir su ambición contra viento y marea.', 'Cesar Zelada', 'Naomi Serrano, Charles Gonzalez, Arthur Romero', 'Inglés', 'Cartelera', 'static/uploads/Kayara.png', 'https://www.youtube.com/watch?v=i_wI-56g7aI'),
(9, 'Captain America: Brave New World', 118, 'Acción, Aventura', 'Recomendada para Mayores de 12 años', 'Tras reunirse con el recién elegido presidente de Estados Unidos, Thaddeus Ross, Sam se encuentra en medio de un incidente internacional. Debe descubrir la razón de un nefasto complot mundial antes de que el verdadero cerebro de la operación haga que el mundo entero se ponga rojo.', 'Julius Onah', 'Anthony Mackie, Harrison Ford, Danny Ramirez, Rosa Salazar, Liv Tyler, Giancarlo Esposito', 'Inglés', 'Cartelera', 'static/uploads/Captain_America-_Brave_New_World.jpeg', 'https://www.youtube.com/watch?v=O_A8HdCDaWM'),
(10, 'A Minecraft Movie', 101, 'Acción, Aventura, Familiar, Fantasia', 'Recomendada para Mayores de 7 años', 'Bienvenido al mundo de Minecraft, donde la creatividad no sólo ayuda a crear, sino que es esencial para la supervivencia. Cuatro inadaptados: Garrett \"El Basurero\" Garrison, Henry , Natalie y Dawn, se encuentran luchando con problemas ordinarios cuando de repente se ven arrastrados a través de un misterioso portal al Mundo Exterior: un extraño país de las maravillas cúbico que se nutre de la imaginación. Para volver a casa, tendrán que dominar este mundo (y protegerlo de cosas malvadas como Piglins y Zombies) mientras se embarcan en una búsqueda mágica en compañía de Steve, un experto artesano. Esta aventura desafiará a los cinco a ser audaces y a volver a conectar con las cualidades que hacen que cada uno de ellos sea único y creativo... las mismas habilidades que necesitan para prosperar en el mundo real.', 'Jared Hess', 'Jack Black, Emma Myers, Jason Momoa ', 'Inglés', 'Próximamente', 'static/uploads/minecraft.jpg', 'https://www.youtube.com/watch?v=bwAbeOvpfq0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `id_sala` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `tipo` enum('2D','3D','IMAX') DEFAULT '2D'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`id_sala`, `nombre`, `capacidad`, `tipo`) VALUES
(6, 'sala 1', 105, '2D'),
(7, 'sala 2', 150, '3D'),
(8, 'sala 3', 240, 'IMAX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id_transaccion` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `tipo` enum('Pago','Reembolso','Ajuste') NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `tipo_id` enum('CC','CE','Pasaporte') NOT NULL,
  `numero_id` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('administrativo','cliente') NOT NULL DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `email`, `direccion`, `tipo_id`, `numero_id`, `telefono`, `password`, `rol`) VALUES
(1, 'Carlos Maestre', 'carlosm@empresa.com', 'CARRERA 2312312', 'CC', '1.007.987.259', '13242342', 'scrypt:32768:8:1$gHXCkW7JkRE5qpe6$99effadf149cae94380252438dcfc72bfaac58cd745f9fb9546ae5d5f6cc4d0bc6d2a0db9576f53f4a57a295f550f27dd08a3050a2273f275b77493dfebea92f', 'administrativo'),
(2, 'cliente1', 'cliente1@cliente.com', 'CARRERA 2312312', 'CC', '2341241', '1234213', 'scrypt:32768:8:1$Lqc6oU8QN1frvZf1$30d81e1dd09d707ee84aa1abb7ff7a04c4e4a3dc9940fa5105fb50880e28646573540173e8253fa1f2019e4eeb193c5952ab4f61af2b8e4f920e38d8ba335c0d', 'cliente'),
(4, 'dsdsd', 'jose@cliente', '424343', 'CC', '2323443', '4324353', 'scrypt:32768:8:1$O0Wnf1QTOhrqLyFE$ec251fcc24b58701f5a9d397e98c0bdb35db591d321b7137541b1b7f3d8aa871d8b7881dfd251034053b8734dc5d8f69a766cd5d75fb8cc8cb23008cbe21ca5b', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_confiteria`
--

CREATE TABLE `ventas_confiteria` (
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD PRIMARY KEY (`id_asiento`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Indices de la tabla `boletos`
--
ALTER TABLE `boletos`
  ADD PRIMARY KEY (`id_boleto`),
  ADD KEY `id_funcion` (`id_funcion`),
  ADD KEY `id_asiento` (`id_asiento`),
  ADD KEY `id_pago` (`id_pago`);

--
-- Indices de la tabla `confiteria`
--
ALTER TABLE `confiteria`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `codigo_factura` (`codigo_factura`),
  ADD KEY `id_pago` (`id_pago`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`id_funcion`),
  ADD KEY `id_pelicula` (`id_pelicula`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Indices de la tabla `historial_facturas`
--
ALTER TABLE `historial_facturas`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`id_metodo`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_metodo` (`id_metodo`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id_pelicula`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id_sala`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id_transaccion`),
  ADD KEY `id_pago` (`id_pago`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `numero_id` (`numero_id`);

--
-- Indices de la tabla `ventas_confiteria`
--
ALTER TABLE `ventas_confiteria`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_pago` (`id_pago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asientos`
--
ALTER TABLE `asientos`
  MODIFY `id_asiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1998;

--
-- AUTO_INCREMENT de la tabla `boletos`
--
ALTER TABLE `boletos`
  MODIFY `id_boleto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `confiteria`
--
ALTER TABLE `confiteria`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funciones`
--
ALTER TABLE `funciones`
  MODIFY `id_funcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historial_facturas`
--
ALTER TABLE `historial_facturas`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id_metodo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas_confiteria`
--
ALTER TABLE `ventas_confiteria`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD CONSTRAINT `asientos_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`) ON DELETE CASCADE;

--
-- Filtros para la tabla `boletos`
--
ALTER TABLE `boletos`
  ADD CONSTRAINT `boletos_ibfk_1` FOREIGN KEY (`id_funcion`) REFERENCES `funciones` (`id_funcion`) ON DELETE CASCADE,
  ADD CONSTRAINT `boletos_ibfk_2` FOREIGN KEY (`id_asiento`) REFERENCES `asientos` (`id_asiento`) ON DELETE CASCADE,
  ADD CONSTRAINT `boletos_ibfk_3` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`);

--
-- Filtros para la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD CONSTRAINT `funciones_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id_pelicula`) ON DELETE CASCADE,
  ADD CONSTRAINT `funciones_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial_facturas`
--
ALTER TABLE `historial_facturas`
  ADD CONSTRAINT `historial_facturas_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_metodo`) REFERENCES `metodos_pago` (`id_metodo`);

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`);

--
-- Filtros para la tabla `ventas_confiteria`
--
ALTER TABLE `ventas_confiteria`
  ADD CONSTRAINT `ventas_confiteria_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `confiteria` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_confiteria_ibfk_2` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
