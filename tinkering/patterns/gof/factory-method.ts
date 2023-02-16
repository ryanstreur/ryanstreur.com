export interface IProduct {}

export interface ICreator {
  product: IProduct;
  factoryMethod(): IProduct;
}

export class ConcreteProduct implements IProduct {}

export class Creator implements ICreator {
  product: IProduct;

  constructor() {
    this.product = this.factoryMethod();
  }

  /**
   * Creates products
   *
   * @remarks
   * Instead of creating the product in the constructor, this pattern lets
   * subclasses override factoryMethod to vary which concrete products they want
   * to create. The point of inflexibility here is the name of the product
   * variable, "creator.product". This can be changed with custom
   * implementations.
   **/
  factoryMethod() {
    return new ConcreteProduct();
  }
}
