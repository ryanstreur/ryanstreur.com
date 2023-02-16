import * as assert from "assert";

import { ConcreteProduct, Creator, IProduct } from "./factory-method";

describe("Factory Method Pattern", function () {
  it("should pass", function () {
    assert(true, "test passes");
  });

  it("should allow user to vary the concrete product type in Creator subclasses", function () {
    // First we create two distinct product subclasses
    class Product1 extends ConcreteProduct {
      x: number = 3;
    }

    class Product2 extends ConcreteProduct {
      x: number = 4;
    }

    // Then we create two Creator subclasses which depend on the custom products for their factoryMethod implementations
    class Creator1 extends Creator {
      product: Product1;
      factoryMethod() {
        return new Product1();
      }
    }

    class Creator2 extends Creator {
      product: Product2;
      factoryMethod() {
        return new Product2();
      }
    }

    // Finally we check to confirm our variable code works as expected
    const creator = new Creator1();
    assert(creator.product.x === 3);

    const creator2 = new Creator2();
    assert(creator2.product.x === 4);
  });
});
