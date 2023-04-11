using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace LoginRegisterUsingIdentity.Migrations
{
    public partial class FirstCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRolesIdentity",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRolesIdentity", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsersIdentity",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    UserName = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    PasswordHash = table.Column<string>(nullable: true),
                    SecurityStamp = table.Column<string>(nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(nullable: true),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false),
                    Firstname = table.Column<string>(type: "nvarchar(100)", nullable: true),
                    LastName = table.Column<string>(type: "nvarchar(100)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsersIdentity", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaimsIdentity",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaimsIdentity", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaimsIdentity_AspNetRoles_RoleId",
                        column: x => x.RoleId,

                        principalTable: "AspNetRolesIdentity",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaimsIdentity",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaimsIdentity", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaimsIdentity_AspNetUsersIdentity_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsersIdentity",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLoginsIdentity",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: false),
                    ProviderKey = table.Column<string>(maxLength: 128, nullable: false),
                    ProviderDisplayName = table.Column<string>(nullable: true),
                    UserId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLoginsIdentity", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLoginsIdentity_AspNetUsersIdentity_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsersIdentity",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRolesIdentity",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    RoleId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRolesIdentity", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRolesIdentity_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRolesIdentity",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRolesIdentity_AspNetUsersIdentity_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsersIdentity",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokensIdentity",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: false),
                    Name = table.Column<string>(maxLength: 128, nullable: false),
                    Value = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokensIdentity", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokensIdentity_AspNetUsersIdentity_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsersIdentity",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaimsIdentity_RoleId",
                table: "AspNetRoleClaimsIdentity",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRolesIdentity",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaimsIdentity_UserId",
                table: "AspNetUserClaimsIdentity",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLoginsIdentity_UserId",
                table: "AspNetUserLoginsIdentity",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRolesIdentity_RoleId",
                table: "AspNetUserRolesIdentity",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsersIdentity",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsersIdentity",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaimsIdentity");

            migrationBuilder.DropTable(
                name: "AspNetUserClaimsIdentity");

            migrationBuilder.DropTable(
                name: "AspNetUserLoginsIdentity");

            migrationBuilder.DropTable(
                name: "AspNetUserRolesIdentity");

            migrationBuilder.DropTable(
                name: "AspNetUserTokensIdentity");

            migrationBuilder.DropTable(
                name: "AspNetRolesIdentity");

            migrationBuilder.DropTable(
                name: "AspNetUsersIdentity");
        }
    }
}
