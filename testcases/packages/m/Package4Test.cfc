component extends="testbox.system.BaseSpec" {

	function run(testResults, testBox) {

		Feature("Asserts", function() {
			var sut = 0;
			beforeEach(function() {
				sut = setup();
			});
			Given("I want to use Booleans", function() {
				When("I run the TestSuite on booleans", function() {
					Then("It should assert true", function() {
						expect(sut.boolTrue()).toBeTrue();
					});
					Then("It should assert false", function() {
						expect(sut.boolFalse()).toBeFalse();
					});
				});
			});
			Given("I want to use integers", function() {
				When("I run the TestSuite on numerics", function() {
					Then("It should assert equals -10", function() {
						expect(sut.integerNegative()).toBe(-10);
					});
					Then("It should assert equals 10", function() {
						expect(sut.integerPositive()).toBe(10);
					});
				});
			});
			Given("I want to use arrays", function() {
				When("I run the TestSuite on arrays", function() {
					Then("It should assert empty", function() {
						expect(sut.emptyArray()).toHaveLength(0);
					});
					Then("It should assert populated", function() {
						expect(sut.populatedArray()).toHaveLength(5);
					});
				});
			});
			Given("I want to use strings", function() {
				When("I run the TestSuite on strings", function() {
					Then("It should assert uppercase", function() {
						expect(sut.upperCase()).toBeWithCase("HELLO");
					});
					Then("It should assert equals 10", function() {
						expect(sut.lowercaseCase()).toBeWithCase("world");
					});
				});
			});
		});
		Feature("Mocking", function() {
			Given("I want to use stubs", function() {
				var stub = 0;
				beforeEach(function() {
					stub = createStub()
						.$("ping").$results("on","off");
				});
				When("I call the stub it should act as a state machine", function() {
					Then("It should assert uppercase", function() {
						expect(stub.ping()).toBe("on");
						expect(stub.ping()).toBe("off");
						expect(stub.ping()).toBe("on");
						expect(stub.ping()).toBe("off");
					});
				});
			});
			Given("I want to use callbacks", function() {
				var stub = 0;
				beforeEach(function() {
					stub = createStub()
						.$("echo").$callback(function(echo) {
							return echo;
						});
				});
				When("I call the mocked method it should echo back the input", function() {
					Then("It should assert uppercase", function() {
						expect(stub.echo("Hello")).toBe("Hello");
						expect(stub.echo("World")).toBe("World");
						expect(stub.echo([])).toBe([]);
					});
				});
			});
		});
	}

	function setup() {
		return this;
	}
	function boolTrue() {
		return true;
	}
	function boolFalse() {
		return false;
	}
	function integerPositive() {
		return 10;
	}
	function integerNegative() {
		return -10;
	}
	function emptyArray() {
		return [];
	}
	function populatedArray() {
		return [1,2,3,4,5];
	}
	function upperCase() {
		return "HELLO";
	}
	function lowercaseCase() {
		return "world";
	}

}
