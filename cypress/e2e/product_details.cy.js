describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("visits the home page", () => {
    cy.get("body").should("exist");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Navigates to product detail page when a product is clicked", () => {
    cy.get(".products article").first().find("a").click();

    // Assert the product detail page content
    cy.get(".product-detail").should("exist");

    // Optional: check for expected content like product name or description
    cy.get(".product-detail h1, .product-detail h2").should("not.be.empty");
  });
});
