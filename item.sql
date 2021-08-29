INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `limit`) VALUES
	('flipvehitem', 'Dụng cụ lật xe', 1000, 0, 1, -1);

INSERT INTO `shops` (`store`, `item`, `price`) VALUES
	('TwentyFourSeven', 'flipvehitem', 50000),
	('RobsLiquor', 'flipvehitem', 50000),
	('LTDgasoline', 'flipvehitem', 50000);