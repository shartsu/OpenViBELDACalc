function [z, d, b, b_0] = LDAmatlab_P300(TrainTargetCSV, TrainNonTargetCSV, InputCSV) 


[TrainNonTarget] = fileProcessor(TrainNonTargetCSV);
[TrainTarget] = fileProcessor(TrainTargetCSV);
[Input] = fileProcessor(InputCSV);

%whos TrainTarget
%whos TrainNonTarget
%whos Input

I = Input(:, 2:201);
% === Caution!
% At first Non-Target then Target in order to make [0,0,0,....1,1,1,....]
Train = vertcat(horzcat(TrainNonTarget(:, 2:201)), horzcat(TrainTarget(:, 2:201)));
Label = vertcat(zeros(length(TrainNonTarget(:, 1)), 1),ones(length(TrainTarget(:, 1)), 1));

Label
whos X
% === LDA

cls = fitcdiscr(Train, Label);
b_0 = cls.Coeffs(1,2).Const;
b = cls.Coeffs(1,2).Linear;

% === Hyperplane b_1*x1 b_2*x2 + b_0 = 0
f = @(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,...
    x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,...
    x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,...
    x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,...
    x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,...
    x100,x101,x102,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115,x116,x117,x118,x119,...
    x120,x121,x122,x123,x124,x125,x126,x127,x128,x129,x130,x131,x132,x133,x134,x135,x136,x137,x138,x139,...
    x140,x141,x142,x143,x144,x145,x146,x147,x148,x149,x150,x151,x152,x153,x154,x155,x156,x157,x158,x159,...
    x160,x161,x162,x163,x164,x165,x166,x167,x168,x169,x170,x171,x172,x173,x174,x175,x176,x177,x178,x179,...
    x180,x181,x182,x183,x184,x185,x186,x187,x188,x189,x190,x191,x192,x193,x194,x195,x196,x197,x198,x199,...
    x200) b_0 +...
    b(1)*x1+b(2)*x2+b(3)*x3+b(4)*x4+b(5)*x5+b(6)*x6+b(7)*x7+b(8)*x8+b(9*x9)+...
    b(10)*x10+b(11)*x11+b(12)*x12+b(13)*x13+b(14)*x14+b(15)*x15+b(16)*x16+b(17)*x17+b(18)*x18+b(19)*x19+...
    b(20)*x20+b(21)*x21+b(22)*x22+b(23)*x23+b(24)*x24+b(25)*x25+b(26)*x26+b(27)*x27+b(28)*x28+b(29)*x29+...
    b(30)*x30+b(31)*x31+b(32)*x32+b(33)*x33+b(34)*x34+b(35)*x35+b(36)*x36+b(37)*x37+b(38)*x38+b(39)*x39+...
    b(40)*x40+b(41)*x41+b(42)*x42+b(43)*x43+b(44)*x44+b(45)*x45+b(46)*x46+b(47)*x47+b(48)*x48+b(49)*x49+...
    b(50)*x50+b(51)*x51+b(52)*x52+b(53)*x53+b(54)*x54+b(55)*x55+b(56)*x56+b(57)*x57+b(58)*x58+b(59)*x59+...
    b(60)*x60+b(61)*x61+b(62)*x62+b(63)*x63+b(64)*x64+b(65)*x65+b(66)*x66+b(67)*x67+b(68)*x68+b(69)*x69+...
    b(70)*x70+b(71)*x71+b(72)*x72+b(73)*x73+b(74)*x74+b(75)*x75+b(76)*x76+b(77)*x77+b(78)*x78+b(79)*x79+...
    b(80)*x80+b(81)*x81+b(82)*x82+b(83)*x83+b(84)*x84+b(85)*x85+b(86)*x86+b(87)*x87+b(88)*x88+b(89)*x89+...
    b(90)*x90+b(91)*x91+b(92)*x92+b(93)*x93+b(94)*x94+b(95)*x95+b(96)*x96+b(97)*x97+b(98)*x98+b(99)*x99+...
    b(100)*x100+b(101)*x101+b(102)*x102+b(103)*x103+b(104)*x104+b(105)*x105+b(106)*x106+b(107)*x107+b(108)*x108+b(109)*x109+...
    b(110)*x110+b(111)*x111+b(112)*x112+b(113)*x113+b(114)*x114+b(115)*x115+b(116)*x116+b(117)*x117+b(118)*x118+b(119)*x119+...
    b(120)*x120+b(121)*x121+b(122)*x122+b(123)*x123+b(124)*x124+b(125)*x125+b(126)*x126+b(127)*x127+b(128)*x128+b(129)*x129+...
    b(130)*x130+b(131)*x131+b(132)*x132+b(133)*x133+b(134)*x134+b(135)*x135+b(136)*x136+b(137)*x137+b(138)*x138+b(139)*x139+...
    b(140)*x140+b(141)*x141+b(142)*x142+b(143)*x143+b(144)*x144+b(145)*x145+b(146)*x146+b(147)*x147+b(148)*x148+b(149)*x149+...
    b(150)*x150+b(151)*x151+b(152)*x152+b(153)*x153+b(154)*x154+b(155)*x155+b(156)*x156+b(157)*x157+b(158)*x158+b(159)*x159+...
    b(160)*x160+b(161)*x161+b(162)*x162+b(163)*x163+b(164)*x164+b(165)*x165+b(166)*x166+b(167)*x167+b(168)*x168+b(169)*x169+...
    b(170)*x170+b(171)*x171+b(172)*x172+b(173)*x173+b(174)*x174+b(175)*x175+b(176)*x176+b(177)*x177+b(178)*x178+b(179)*x179+...
    b(180)*x180+b(181)*x181+b(182)*x182+b(183)*x183+b(184)*x184+b(185)*x185+b(186)*x186+b(187)*x187+b(188)*x188+b(189)*x189+...
    b(190)*x190+b(191)*x191+b(192)*x192+b(193)*x193+b(194)*x194+b(195)*x195+b(196)*x196+b(197)*x197+b(198)*x198+b(199)*x199+...
    b(200)*x200;

% === Is z plus or not? 

z_1 = b(1)*I(1,1)+b(2)*I(1,2)+b(3)*I(1,3)+b(4)*I(1,4)+b(5)*I(1,5)+b(6)*I(1,6)+b(7)*I(1,7)+b(8)*I(1,8)+b(9)*I(1,9)+...
    b(10)*I(1,10)+b(11)*I(1,11)+b(12)*I(1,12)+b(13)*I(1,13)+b(14)*I(1,14)+b(15)*I(1,15)+b(16)*I(1,16)+b(17)*I(1,17)+b(18)*I(1,18)+b(19)*I(1,19)+...
    b(20)*I(1,20)+b(21)*I(1,21)+b(22)*I(1,22)+b(23)*I(1,23)+b(24)*I(1,24)+b(25)*I(1,25)+b(26)*I(1,26)+b(27)*I(1,27)+b(28)*I(1,28)+b(29)*I(1,29)+...
    b(30)*I(1,30)+b(31)*I(1,31)+b(32)*I(1,32)+b(33)*I(1,33)+b(34)*I(1,34)+b(35)*I(1,35)+b(36)*I(1,36)+b(37)*I(1,37)+b(38)*I(1,38)+b(39)*I(1,39)+...
    b(40)*I(1,40)+b(41)*I(1,41)+b(42)*I(1,42)+b(43)*I(1,43)+b(44)*I(1,44)+b(45)*I(1,45)+b(46)*I(1,46)+b(47)*I(1,47)+b(48)*I(1,48)+b(49)*I(1,49)+...
    b(50)*I(1,50)+b(51)*I(1,51)+b(52)*I(1,52)+b(53)*I(1,53)+b(54)*I(1,54)+b(55)*I(1,55)+b(56)*I(1,56)+b(57)*I(1,57)+b(58)*I(1,58)+b(59)*I(1,59)+...
    b(60)*I(1,60)+b(61)*I(1,61)+b(62)*I(1,62)+b(63)*I(1,63)+b(64)*I(1,64)+b(65)*I(1,65)+b(66)*I(1,66)+b(67)*I(1,67)+b(68)*I(1,68)+b(69)*I(1,69)+...
    b(70)*I(1,70)+b(71)*I(1,71)+b(72)*I(1,72)+b(73)*I(1,73)+b(74)*I(1,74)+b(75)*I(1,75)+b(76)*I(1,76)+b(77)*I(1,77)+b(78)*I(1,78)+b(79)*I(1,79)+...
    b(80)*I(1,80)+b(81)*I(1,81)+b(82)*I(1,82)+b(83)*I(1,83)+b(84)*I(1,84)+b(85)*I(1,85)+b(86)*I(1,86)+b(87)*I(1,87)+b(88)*I(1,88)+b(89)*I(1,89)+...
    b(90)*I(1,90)+b(91)*I(1,91)+b(92)*I(1,92)+b(93)*I(1,93)+b(94)*I(1,94)+b(95)*I(1,95)+b(96)*I(1,96)+b(97)*I(1,97)+b(98)*I(1,98)+b(99)*I(1,99)+...
    b(100)*I(1,100)+b(101)*I(1,101)+b(102)*I(1,102)+b(103)*I(1,103)+b(104)*I(1,104)+b(105)*I(1,105)+b(106)*I(1,106)+b(107)*I(1,107)+b(108)*I(1,108)+b(109)*I(1,109)+...
    b(110)*I(1,110)+b(111)*I(1,111)+b(112)*I(1,112)+b(113)*I(1,113)+b(114)*I(1,114)+b(115)*I(1,115)+b(116)*I(1,116)+b(117)*I(1,117)+b(118)*I(1,118)+b(119)*I(1,119)+...
    b(120)*I(1,120)+b(121)*I(1,121)+b(122)*I(1,122)+b(123)*I(1,123)+b(124)*I(1,124)+b(125)*I(1,125)+b(126)*I(1,126)+b(127)*I(1,127)+b(128)*I(1,128)+b(129)*I(1,129)+...
    b(130)*I(1,130)+b(131)*I(1,131)+b(132)*I(1,132)+b(133)*I(1,133)+b(134)*I(1,134)+b(135)*I(1,135)+b(136)*I(1,136)+b(137)*I(1,137)+b(138)*I(1,138)+b(139)*I(1,139)+...
    b(140)*I(1,140)+b(141)*I(1,141)+b(142)*I(1,142)+b(143)*I(1,143)+b(144)*I(1,144)+b(145)*I(1,145)+b(146)*I(1,146)+b(147)*I(1,147)+b(148)*I(1,148)+b(149)*I(1,149)+...
    b(150)*I(1,150)+b(151)*I(1,151)+b(152)*I(1,152)+b(153)*I(1,153)+b(154)*I(1,154)+b(155)*I(1,155)+b(156)*I(1,156)+b(157)*I(1,157)+b(158)*I(1,158)+b(159)*I(1,159)+...
    b(160)*I(1,160)+b(161)*I(1,161)+b(162)*I(1,162)+b(163)*I(1,163)+b(164)*I(1,164)+b(165)*I(1,165)+b(166)*I(1,166)+b(167)*I(1,167)+b(168)*I(1,168)+b(169)*I(1,169)+...
    b(170)*I(1,170)+b(171)*I(1,171)+b(172)*I(1,172)+b(173)*I(1,173)+b(174)*I(1,174)+b(175)*I(1,175)+b(176)*I(1,176)+b(177)*I(1,177)+b(178)*I(1,178)+b(179)*I(1,179)+...
    b(180)*I(1,180)+b(181)*I(1,181)+b(182)*I(1,182)+b(183)*I(1,183)+b(184)*I(1,184)+b(185)*I(1,185)+b(186)*I(1,186)+b(187)*I(1,187)+b(188)*I(1,188)+b(189)*I(1,189)+...
    b(190)*I(1,190)+b(191)*I(1,191)+b(192)*I(1,192)+b(193)*I(1,193)+b(194)*I(1,194)+b(195)*I(1,195)+b(196)*I(1,196)+b(197)*I(1,197)+b(198)*I(1,198)+b(199)*I(1,199)+...
    b(200)*I(1,200)+b_0;


z_2 = b(1)*I(2,1)+b(2)*I(2,2)+b(3)*I(2,3)+b(4)*I(2,4)+b(5)*I(2,5)+b(6)*I(2,6)+b(7)*I(2,7)+b(8)*I(2,8)+b(9)*I(2,9)+...
    b(10)*I(2,10)+b(11)*I(2,11)+b(12)*I(2,12)+b(13)*I(2,13)+b(14)*I(2,14)+b(15)*I(2,15)+b(16)*I(2,16)+b(17)*I(2,17)+b(18)*I(2,18)+b(19)*I(2,19)+...
    b(20)*I(2,20)+b(21)*I(2,21)+b(22)*I(2,22)+b(23)*I(2,23)+b(24)*I(2,24)+b(25)*I(2,25)+b(26)*I(2,26)+b(27)*I(2,27)+b(28)*I(2,28)+b(29)*I(2,29)+...
    b(30)*I(2,30)+b(31)*I(2,31)+b(32)*I(2,32)+b(33)*I(2,33)+b(34)*I(2,34)+b(35)*I(2,35)+b(36)*I(2,36)+b(37)*I(2,37)+b(38)*I(2,38)+b(39)*I(2,39)+...
    b(40)*I(2,40)+b(41)*I(2,41)+b(42)*I(2,42)+b(43)*I(2,43)+b(44)*I(2,44)+b(45)*I(2,45)+b(46)*I(2,46)+b(47)*I(2,47)+b(48)*I(2,48)+b(49)*I(2,49)+...
    b(50)*I(2,50)+b(51)*I(2,51)+b(52)*I(2,52)+b(53)*I(2,53)+b(54)*I(2,54)+b(55)*I(2,55)+b(56)*I(2,56)+b(57)*I(2,57)+b(58)*I(2,58)+b(59)*I(2,59)+...
    b(60)*I(2,60)+b(61)*I(2,61)+b(62)*I(2,62)+b(63)*I(2,63)+b(64)*I(2,64)+b(65)*I(2,65)+b(66)*I(2,66)+b(67)*I(2,67)+b(68)*I(2,68)+b(69)*I(2,69)+...
    b(70)*I(2,70)+b(71)*I(2,71)+b(72)*I(2,72)+b(73)*I(2,73)+b(74)*I(2,74)+b(75)*I(2,75)+b(76)*I(2,76)+b(77)*I(2,77)+b(78)*I(2,78)+b(79)*I(2,79)+...
    b(80)*I(2,80)+b(81)*I(2,81)+b(82)*I(2,82)+b(83)*I(2,83)+b(84)*I(2,84)+b(85)*I(2,85)+b(86)*I(2,86)+b(87)*I(2,87)+b(88)*I(2,88)+b(89)*I(2,89)+...
    b(90)*I(2,90)+b(91)*I(2,91)+b(92)*I(2,92)+b(93)*I(2,93)+b(94)*I(2,94)+b(95)*I(2,95)+b(96)*I(2,96)+b(97)*I(2,97)+b(98)*I(2,98)+b(99)*I(2,99)+...
    b(100)*I(2,100)+b(101)*I(2,101)+b(102)*I(2,102)+b(103)*I(2,103)+b(104)*I(2,104)+b(105)*I(2,105)+b(106)*I(2,106)+b(107)*I(2,107)+b(108)*I(2,108)+b(109)*I(2,109)+...
    b(110)*I(2,110)+b(111)*I(2,111)+b(112)*I(2,112)+b(113)*I(2,113)+b(114)*I(2,114)+b(115)*I(2,115)+b(116)*I(2,116)+b(117)*I(2,117)+b(118)*I(2,118)+b(119)*I(2,119)+...
    b(120)*I(2,120)+b(121)*I(2,121)+b(122)*I(2,122)+b(123)*I(2,123)+b(124)*I(2,124)+b(125)*I(2,125)+b(126)*I(2,126)+b(127)*I(2,127)+b(128)*I(2,128)+b(129)*I(2,129)+...
    b(130)*I(2,130)+b(131)*I(2,131)+b(132)*I(2,132)+b(133)*I(2,133)+b(134)*I(2,134)+b(135)*I(2,135)+b(136)*I(2,136)+b(137)*I(2,137)+b(138)*I(2,138)+b(139)*I(2,139)+...
    b(140)*I(2,140)+b(141)*I(2,141)+b(142)*I(2,142)+b(143)*I(2,143)+b(144)*I(2,144)+b(145)*I(2,145)+b(146)*I(2,146)+b(147)*I(2,147)+b(148)*I(2,148)+b(149)*I(2,149)+...
    b(150)*I(2,150)+b(151)*I(2,151)+b(152)*I(2,152)+b(153)*I(2,153)+b(154)*I(2,154)+b(155)*I(2,155)+b(156)*I(2,156)+b(157)*I(2,157)+b(158)*I(2,158)+b(159)*I(2,159)+...
    b(160)*I(2,160)+b(161)*I(2,161)+b(162)*I(2,162)+b(163)*I(2,163)+b(164)*I(2,164)+b(165)*I(2,165)+b(166)*I(2,166)+b(167)*I(2,167)+b(168)*I(2,168)+b(169)*I(2,169)+...
    b(170)*I(2,170)+b(171)*I(2,171)+b(172)*I(2,172)+b(173)*I(2,173)+b(174)*I(2,174)+b(175)*I(2,175)+b(176)*I(2,176)+b(177)*I(2,177)+b(178)*I(2,178)+b(179)*I(2,179)+...
    b(180)*I(2,180)+b(181)*I(2,181)+b(182)*I(2,182)+b(183)*I(2,183)+b(184)*I(2,184)+b(185)*I(2,185)+b(186)*I(2,186)+b(187)*I(2,187)+b(188)*I(2,188)+b(189)*I(2,189)+...
    b(190)*I(2,190)+b(191)*I(2,191)+b(192)*I(2,192)+b(193)*I(2,193)+b(194)*I(2,194)+b(195)*I(2,195)+b(196)*I(2,196)+b(197)*I(2,197)+b(198)*I(2,198)+b(199)*I(2,199)+...
    b(200)*I(2,200)+b_0;

z_3 = b(1)*I(3,1)+b(2)*I(3,2)+b(3)*I(3,3)+b(4)*I(3,4)+b(5)*I(3,5)+b(6)*I(3,6)+b(7)*I(3,7)+b(8)*I(3,8)+b(9)*I(3,9)+...
    b(10)*I(3,10)+b(11)*I(3,11)+b(12)*I(3,12)+b(13)*I(3,13)+b(14)*I(3,14)+b(15)*I(3,15)+b(16)*I(3,16)+b(17)*I(3,17)+b(18)*I(3,18)+b(19)*I(3,19)+...
    b(20)*I(3,20)+b(21)*I(3,21)+b(22)*I(3,22)+b(23)*I(3,23)+b(24)*I(3,24)+b(25)*I(3,25)+b(26)*I(3,26)+b(27)*I(3,27)+b(28)*I(3,28)+b(29)*I(3,29)+...
    b(30)*I(3,30)+b(31)*I(3,31)+b(32)*I(3,32)+b(33)*I(3,33)+b(34)*I(3,34)+b(35)*I(3,35)+b(36)*I(3,36)+b(37)*I(3,37)+b(38)*I(3,38)+b(39)*I(3,39)+...
    b(40)*I(3,40)+b(41)*I(3,41)+b(42)*I(3,42)+b(43)*I(3,43)+b(44)*I(3,44)+b(45)*I(3,45)+b(46)*I(3,46)+b(47)*I(3,47)+b(48)*I(3,48)+b(49)*I(3,49)+...
    b(50)*I(3,50)+b(51)*I(3,51)+b(52)*I(3,52)+b(53)*I(3,53)+b(54)*I(3,54)+b(55)*I(3,55)+b(56)*I(3,56)+b(57)*I(3,57)+b(58)*I(3,58)+b(59)*I(3,59)+...
    b(60)*I(3,60)+b(61)*I(3,61)+b(62)*I(3,62)+b(63)*I(3,63)+b(64)*I(3,64)+b(65)*I(3,65)+b(66)*I(3,66)+b(67)*I(3,67)+b(68)*I(3,68)+b(69)*I(3,69)+...
    b(70)*I(3,70)+b(71)*I(3,71)+b(72)*I(3,72)+b(73)*I(3,73)+b(74)*I(3,74)+b(75)*I(3,75)+b(76)*I(3,76)+b(77)*I(3,77)+b(78)*I(3,78)+b(79)*I(3,79)+...
    b(80)*I(3,80)+b(81)*I(3,81)+b(82)*I(3,82)+b(83)*I(3,83)+b(84)*I(3,84)+b(85)*I(3,85)+b(86)*I(3,86)+b(87)*I(3,87)+b(88)*I(3,88)+b(89)*I(3,89)+...
    b(90)*I(3,90)+b(91)*I(3,91)+b(92)*I(3,92)+b(93)*I(3,93)+b(94)*I(3,94)+b(95)*I(3,95)+b(96)*I(3,96)+b(97)*I(3,97)+b(98)*I(3,98)+b(99)*I(3,99)+...
    b(100)*I(3,100)+b(101)*I(3,101)+b(102)*I(3,102)+b(103)*I(3,103)+b(104)*I(3,104)+b(105)*I(3,105)+b(106)*I(3,106)+b(107)*I(3,107)+b(108)*I(3,108)+b(109)*I(3,109)+...
    b(110)*I(3,110)+b(111)*I(3,111)+b(112)*I(3,112)+b(113)*I(3,113)+b(114)*I(3,114)+b(115)*I(3,115)+b(116)*I(3,116)+b(117)*I(3,117)+b(118)*I(3,118)+b(119)*I(3,119)+...
    b(120)*I(3,120)+b(121)*I(3,121)+b(122)*I(3,122)+b(123)*I(3,123)+b(124)*I(3,124)+b(125)*I(3,125)+b(126)*I(3,126)+b(127)*I(3,127)+b(128)*I(3,128)+b(129)*I(3,129)+...
    b(130)*I(3,130)+b(131)*I(3,131)+b(132)*I(3,132)+b(133)*I(3,133)+b(134)*I(3,134)+b(135)*I(3,135)+b(136)*I(3,136)+b(137)*I(3,137)+b(138)*I(3,138)+b(139)*I(3,139)+...
    b(140)*I(3,140)+b(141)*I(3,141)+b(142)*I(3,142)+b(143)*I(3,143)+b(144)*I(3,144)+b(145)*I(3,145)+b(146)*I(3,146)+b(147)*I(3,147)+b(148)*I(3,148)+b(149)*I(3,149)+...
    b(150)*I(3,150)+b(151)*I(3,151)+b(152)*I(3,152)+b(153)*I(3,153)+b(154)*I(3,154)+b(155)*I(3,155)+b(156)*I(3,156)+b(157)*I(3,157)+b(158)*I(3,158)+b(159)*I(3,159)+...
    b(160)*I(3,160)+b(161)*I(3,161)+b(162)*I(3,162)+b(163)*I(3,163)+b(164)*I(3,164)+b(165)*I(3,165)+b(166)*I(3,166)+b(167)*I(3,167)+b(168)*I(3,168)+b(169)*I(3,169)+...
    b(170)*I(3,170)+b(171)*I(3,171)+b(172)*I(3,172)+b(173)*I(3,173)+b(174)*I(3,174)+b(175)*I(3,175)+b(176)*I(3,176)+b(177)*I(3,177)+b(178)*I(3,178)+b(179)*I(3,179)+...
    b(180)*I(3,180)+b(181)*I(3,181)+b(182)*I(3,182)+b(183)*I(3,183)+b(184)*I(3,184)+b(185)*I(3,185)+b(186)*I(3,186)+b(187)*I(3,187)+b(188)*I(3,188)+b(189)*I(3,189)+...
    b(190)*I(3,190)+b(191)*I(3,191)+b(192)*I(3,192)+b(193)*I(3,193)+b(194)*I(3,194)+b(195)*I(3,195)+b(196)*I(3,196)+b(197)*I(3,197)+b(198)*I(3,198)+b(199)*I(3,199)+...
    b(200)*I(3,200);

z_4 = b(1)*I(4,1)+b(2)*I(4,2)+b(3)*I(4,3)+b(4)*I(4,4)+b(5)*I(4,5)+b(6)*I(4,6)+b(7)*I(4,7)+b(8)*I(4,8)+b(9)*I(4,9)+...
    b(10)*I(4,10)+b(11)*I(4,11)+b(12)*I(4,12)+b(13)*I(4,13)+b(14)*I(4,14)+b(15)*I(4,15)+b(16)*I(4,16)+b(17)*I(4,17)+b(18)*I(4,18)+b(19)*I(4,19)+...
    b(20)*I(4,20)+b(21)*I(4,21)+b(22)*I(4,22)+b(23)*I(4,23)+b(24)*I(4,24)+b(25)*I(4,25)+b(26)*I(4,26)+b(27)*I(4,27)+b(28)*I(4,28)+b(29)*I(4,29)+...
    b(30)*I(4,30)+b(31)*I(4,31)+b(32)*I(4,32)+b(33)*I(4,33)+b(34)*I(4,34)+b(35)*I(4,35)+b(36)*I(4,36)+b(37)*I(4,37)+b(38)*I(4,38)+b(39)*I(4,39)+...
    b(40)*I(4,40)+b(41)*I(4,41)+b(42)*I(4,42)+b(43)*I(4,43)+b(44)*I(4,44)+b(45)*I(4,45)+b(46)*I(4,46)+b(47)*I(4,47)+b(48)*I(4,48)+b(49)*I(4,49)+...
    b(50)*I(4,50)+b(51)*I(4,51)+b(52)*I(4,52)+b(53)*I(4,53)+b(54)*I(4,54)+b(55)*I(4,55)+b(56)*I(4,56)+b(57)*I(4,57)+b(58)*I(4,58)+b(59)*I(4,59)+...
    b(60)*I(4,60)+b(61)*I(4,61)+b(62)*I(4,62)+b(63)*I(4,63)+b(64)*I(4,64)+b(65)*I(4,65)+b(66)*I(4,66)+b(67)*I(4,67)+b(68)*I(4,68)+b(69)*I(4,69)+...
    b(70)*I(4,70)+b(71)*I(4,71)+b(72)*I(4,72)+b(73)*I(4,73)+b(74)*I(4,74)+b(75)*I(4,75)+b(76)*I(4,76)+b(77)*I(4,77)+b(78)*I(4,78)+b(79)*I(4,79)+...
    b(80)*I(4,80)+b(81)*I(4,81)+b(82)*I(4,82)+b(83)*I(4,83)+b(84)*I(4,84)+b(85)*I(4,85)+b(86)*I(4,86)+b(87)*I(4,87)+b(88)*I(4,88)+b(89)*I(4,89)+...
    b(90)*I(4,90)+b(91)*I(4,91)+b(92)*I(4,92)+b(93)*I(4,93)+b(94)*I(4,94)+b(95)*I(4,95)+b(96)*I(4,96)+b(97)*I(4,97)+b(98)*I(4,98)+b(99)*I(4,99)+...
    b(100)*I(4,100)+b(101)*I(4,101)+b(102)*I(4,102)+b(103)*I(4,103)+b(104)*I(4,104)+b(105)*I(4,105)+b(106)*I(4,106)+b(107)*I(4,107)+b(108)*I(4,108)+b(109)*I(4,109)+...
    b(110)*I(4,110)+b(111)*I(4,111)+b(112)*I(4,112)+b(113)*I(4,113)+b(114)*I(4,114)+b(115)*I(4,115)+b(116)*I(4,116)+b(117)*I(4,117)+b(118)*I(4,118)+b(119)*I(4,119)+...
    b(120)*I(4,120)+b(121)*I(4,121)+b(122)*I(4,122)+b(123)*I(4,123)+b(124)*I(4,124)+b(125)*I(4,125)+b(126)*I(4,126)+b(127)*I(4,127)+b(128)*I(4,128)+b(129)*I(4,129)+...
    b(130)*I(4,130)+b(131)*I(4,131)+b(132)*I(4,132)+b(133)*I(4,133)+b(134)*I(4,134)+b(135)*I(4,135)+b(136)*I(4,136)+b(137)*I(4,137)+b(138)*I(4,138)+b(139)*I(4,139)+...
    b(140)*I(4,140)+b(141)*I(4,141)+b(142)*I(4,142)+b(143)*I(4,143)+b(144)*I(4,144)+b(145)*I(4,145)+b(146)*I(4,146)+b(147)*I(4,147)+b(148)*I(4,148)+b(149)*I(4,149)+...
    b(150)*I(4,150)+b(151)*I(4,151)+b(152)*I(4,152)+b(153)*I(4,153)+b(154)*I(4,154)+b(155)*I(4,155)+b(156)*I(4,156)+b(157)*I(4,157)+b(158)*I(4,158)+b(159)*I(4,159)+...
    b(160)*I(4,160)+b(161)*I(4,161)+b(162)*I(4,162)+b(163)*I(4,163)+b(164)*I(4,164)+b(165)*I(4,165)+b(166)*I(4,166)+b(167)*I(4,167)+b(168)*I(4,168)+b(169)*I(4,169)+...
    b(170)*I(4,170)+b(171)*I(4,171)+b(172)*I(4,172)+b(173)*I(4,173)+b(174)*I(4,174)+b(175)*I(4,175)+b(176)*I(4,176)+b(177)*I(4,177)+b(178)*I(4,178)+b(179)*I(4,179)+...
    b(180)*I(4,180)+b(181)*I(4,181)+b(182)*I(4,182)+b(183)*I(4,183)+b(184)*I(4,184)+b(185)*I(4,185)+b(186)*I(4,186)+b(187)*I(4,187)+b(188)*I(4,188)+b(189)*I(4,189)+...
    b(190)*I(4,190)+b(191)*I(4,191)+b(192)*I(4,192)+b(193)*I(4,193)+b(194)*I(4,194)+b(195)*I(4,195)+b(196)*I(4,196)+b(197)*I(4,197)+b(198)*I(4,198)+b(199)*I(4,199)+...
    b(200)*I(4,200)+b_0;

norm = sqrt(b(1).^2+b(2).^2+b(3).^2+b(4).^2+b(5).^2+b(6).^2+b(7).^2+b(8).^2+b(9).^2+...
    b(11).^2+b(12).^2+b(13).^2+b(14).^2+b(15).^2+b(16).^2+b(17).^2+b(18).^2+b(19).^2+...
    b(21).^2+b(22).^2+b(23).^2+b(24).^2+b(25).^2+b(26).^2+b(27).^2+b(28).^2+b(29).^2+...
    b(31).^2+b(32).^2+b(33).^2+b(34).^2+b(35).^2+b(36).^2+b(37).^2+b(38).^2+b(39).^2+...
    b(41).^2+b(42).^2+b(43).^2+b(44).^2+b(45).^2+b(46).^2+b(47).^2+b(48).^2+b(49).^2+...
    b(51).^2+b(52).^2+b(53).^2+b(54).^2+b(55).^2+b(56).^2+b(57).^2+b(58).^2+b(59).^2+...
    b(61).^2+b(62).^2+b(63).^2+b(64).^2+b(65).^2+b(66).^2+b(67).^2+b(68).^2+b(69).^2+...
    b(71).^2+b(72).^2+b(73).^2+b(74).^2+b(75).^2+b(76).^2+b(77).^2+b(78).^2+b(79).^2+...
    b(81).^2+b(82).^2+b(83).^2+b(84).^2+b(85).^2+b(86).^2+b(87).^2+b(88).^2+b(89).^2+...
    b(91).^2+b(92).^2+b(93).^2+b(94).^2+b(95).^2+b(96).^2+b(97).^2+b(98).^2+b(99).^2+...
    b(101).^2+b(102).^2+b(103).^2+b(104).^2+b(105).^2+b(106).^2+b(107).^2+b(108).^2+b(109).^2+...
    b(111).^2+b(112).^2+b(113).^2+b(114).^2+b(115).^2+b(116).^2+b(117).^2+b(118).^2+b(119).^2+...
    b(121).^2+b(122).^2+b(123).^2+b(124).^2+b(125).^2+b(126).^2+b(127).^2+b(128).^2+b(129).^2+...
    b(131).^2+b(132).^2+b(133).^2+b(134).^2+b(135).^2+b(136).^2+b(137).^2+b(138).^2+b(139).^2+...
    b(141).^2+b(142).^2+b(143).^2+b(144).^2+b(145).^2+b(146).^2+b(147).^2+b(148).^2+b(149).^2+...
    b(151).^2+b(152).^2+b(153).^2+b(154).^2+b(155).^2+b(156).^2+b(157).^2+b(158).^2+b(159).^2+...
    b(161).^2+b(162).^2+b(163).^2+b(164).^2+b(165).^2+b(166).^2+b(167).^2+b(168).^2+b(169).^2+...
    b(171).^2+b(172).^2+b(173).^2+b(174).^2+b(175).^2+b(176).^2+b(177).^2+b(178).^2+b(179).^2+...
    b(181).^2+b(182).^2+b(183).^2+b(184).^2+b(185).^2+b(186).^2+b(187).^2+b(188).^2+b(189).^2+...
    b(191).^2+b(192).^2+b(193).^2+b(194).^2+b(195).^2+b(196).^2+b(197).^2+b(198).^2+b(199).^2+...
    b(200).^2);

d_1 = abs(z_1)/norm;
d_2 = abs(z_2)/norm;
d_3 = abs(z_3)/norm;
d_4 = abs(z_4)/norm;

z = [z_1; z_2; z_3; z_4];
d = [d_1; d_2; d_3; d_4];


% === Depict Hyperplane 
%{
figure
h1 = ezplot(f, [-1.0e+11 1.0e+11 -1.0e+11 1.0e+11]); 
h1.Color = 'b';
h1.LineWidth = 2;
hold on

vline = line([0,0],[-1.0e+12,1.0e+12]);
vline.Color = 'r';
hline = refline([0 0]);
hline.Color = 'r';
%}


end