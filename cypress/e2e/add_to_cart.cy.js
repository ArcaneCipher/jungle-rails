describe("Add to Cart", () => {
  beforeEach(() => {
    cy.visit("/");
    cy.get("body").should("exist");
  });

  it("adds a product to the cart", () => {
    // Ensure product is on page
    cy.get(".products article").should("have.length.at.least", 1);

    // Click the first "Add" button
    cy.get(".products article")
      .first()
      .within(() => {
        cy.contains("Add").click({ force: true });
      });

    // Check that the cart count updated
    cy.get(".navbar").contains("My Cart (1)").should("be.visible");
  });
});
