"GENERATED"

load("@rules_dotnet//dotnet:defs.bzl", "nuget_repo")

def sharp_boost_voronoi_deps():
    "sharp_boost_voronoi_deps"
    nuget_repo(
        name = "paket.sharp_boost_voronoi_deps",
        packages = [
            {"name": "Microsoft.CodeCoverage", "id": "Microsoft.CodeCoverage", "version": "17.12.0", "sha512": "sha512-POBqg788rrLApvncy8rvtyJ3ynsBdU0/SGUXD+vPqyRDM/aUJbPZWx01qalGJRK1GcArSku8QDd9AVMa0TkCkA==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": [], "net462": [], "net47": [], "net471": [], "net472": [], "net48": [], "net5.0": [], "net6.0": [], "net7.0": [], "net8.0": [], "netcoreapp1.0": [], "netcoreapp1.1": [], "netcoreapp2.0": [], "netcoreapp2.1": [], "netcoreapp2.2": [], "netcoreapp3.0": [], "netcoreapp3.1": [], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": [], "netstandard1.5": [], "netstandard1.6": [], "netstandard2.0": [], "netstandard2.1": []}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "Microsoft.NET.Test.Sdk", "id": "Microsoft.NET.Test.Sdk", "version": "17.8.0", "sha512": "sha512-8hHyYQE3zRFGIb1shBjlKmQUmvN8F2p59BiJL6221dujHqRiKpXGflCzKpL7Gx1df7mAUCxclXDcxMMljGeH6Q==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": [], "net462": ["Microsoft.CodeCoverage"], "net47": ["Microsoft.CodeCoverage"], "net471": ["Microsoft.CodeCoverage"], "net472": ["Microsoft.CodeCoverage"], "net48": ["Microsoft.CodeCoverage"], "net5.0": ["Microsoft.TestPlatform.TestHost", "Microsoft.CodeCoverage"], "net6.0": ["Microsoft.TestPlatform.TestHost", "Microsoft.CodeCoverage"], "net7.0": ["Microsoft.TestPlatform.TestHost", "Microsoft.CodeCoverage"], "net8.0": ["Microsoft.TestPlatform.TestHost", "Microsoft.CodeCoverage"], "netcoreapp1.0": [], "netcoreapp1.1": [], "netcoreapp2.0": [], "netcoreapp2.1": [], "netcoreapp2.2": [], "netcoreapp3.0": [], "netcoreapp3.1": ["Microsoft.TestPlatform.TestHost", "Microsoft.CodeCoverage"], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": [], "netstandard1.5": [], "netstandard1.6": [], "netstandard2.0": [], "netstandard2.1": []}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "Microsoft.NETCore.Platforms", "id": "Microsoft.NETCore.Platforms", "version": "7.0.4", "sha512": "sha512-mcQWjuDBh4WHGG4WcBI0k025WAdA2afMm6fs42sm1f+3gRyNQUiuMVT5gAWNUGSHmlu6qn/TCnAQpfl4Gm6cBw==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": [], "net462": [], "net47": [], "net471": [], "net472": [], "net48": [], "net5.0": [], "net6.0": [], "net7.0": [], "net8.0": [], "netcoreapp1.0": [], "netcoreapp1.1": [], "netcoreapp2.0": [], "netcoreapp2.1": [], "netcoreapp2.2": [], "netcoreapp3.0": [], "netcoreapp3.1": [], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": [], "netstandard1.5": [], "netstandard1.6": [], "netstandard2.0": [], "netstandard2.1": []}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "Microsoft.TestPlatform.ObjectModel", "id": "Microsoft.TestPlatform.ObjectModel", "version": "17.12.0", "sha512": "sha512-klsXMgAPNWYo3ceakLkod4wYrk4lAV2Ehi676zUKgiVpQ5Yj6q3vsMhk/3pm97Ltk/hdcSW0rJKJvcQvTzPgYA==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": ["System.Reflection.Metadata"], "net462": ["System.Reflection.Metadata"], "net47": ["System.Reflection.Metadata"], "net471": ["System.Reflection.Metadata"], "net472": ["System.Reflection.Metadata"], "net48": ["System.Reflection.Metadata"], "net5.0": ["System.Reflection.Metadata"], "net6.0": ["System.Reflection.Metadata"], "net7.0": ["System.Reflection.Metadata"], "net8.0": ["System.Reflection.Metadata"], "netcoreapp1.0": [], "netcoreapp1.1": [], "netcoreapp2.0": ["System.Reflection.Metadata"], "netcoreapp2.1": ["System.Reflection.Metadata"], "netcoreapp2.2": ["System.Reflection.Metadata"], "netcoreapp3.0": ["System.Reflection.Metadata"], "netcoreapp3.1": ["System.Reflection.Metadata"], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": [], "netstandard1.5": [], "netstandard1.6": [], "netstandard2.0": ["System.Reflection.Metadata"], "netstandard2.1": ["System.Reflection.Metadata"]}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "Microsoft.TestPlatform.TestHost", "id": "Microsoft.TestPlatform.TestHost", "version": "17.12.0", "sha512": "sha512-gYM2BOGQvFEP2fZt61f3f5Gu+imL1G1bvGUrbJjpYcl66R6uzs5yESg0XMn8IgUgldz8RldOOaYmjk2KcSeG1Q==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": [], "net462": [], "net47": [], "net471": [], "net472": [], "net48": [], "net5.0": ["Microsoft.TestPlatform.ObjectModel", "Newtonsoft.Json"], "net6.0": ["Microsoft.TestPlatform.ObjectModel", "Newtonsoft.Json"], "net7.0": ["Microsoft.TestPlatform.ObjectModel", "Newtonsoft.Json"], "net8.0": ["Microsoft.TestPlatform.ObjectModel", "Newtonsoft.Json"], "netcoreapp1.0": [], "netcoreapp1.1": [], "netcoreapp2.0": [], "netcoreapp2.1": [], "netcoreapp2.2": [], "netcoreapp3.0": [], "netcoreapp3.1": ["Microsoft.TestPlatform.ObjectModel", "Newtonsoft.Json"], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": [], "netstandard1.5": [], "netstandard1.6": [], "netstandard2.0": [], "netstandard2.1": []}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "NETStandard.Library", "id": "NETStandard.Library", "version": "2.0.3", "sha512": "sha512-548M6mnBSJWxsIlkQHfbzoYxpiYFXZZSL00p4GHYv8PkiqFBnnT68mW5mGEsA/ch9fDO9GkPgkFQpWiXZN7mAQ==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": ["Microsoft.NETCore.Platforms"], "net451": ["Microsoft.NETCore.Platforms"], "net452": ["Microsoft.NETCore.Platforms"], "net46": ["Microsoft.NETCore.Platforms"], "net461": ["Microsoft.NETCore.Platforms"], "net462": ["Microsoft.NETCore.Platforms"], "net47": ["Microsoft.NETCore.Platforms"], "net471": ["Microsoft.NETCore.Platforms"], "net472": ["Microsoft.NETCore.Platforms"], "net48": ["Microsoft.NETCore.Platforms"], "net5.0": ["Microsoft.NETCore.Platforms"], "net6.0": ["Microsoft.NETCore.Platforms"], "net7.0": ["Microsoft.NETCore.Platforms"], "net8.0": ["Microsoft.NETCore.Platforms"], "netcoreapp1.0": ["Microsoft.NETCore.Platforms"], "netcoreapp1.1": ["Microsoft.NETCore.Platforms"], "netcoreapp2.0": ["Microsoft.NETCore.Platforms"], "netcoreapp2.1": ["Microsoft.NETCore.Platforms"], "netcoreapp2.2": ["Microsoft.NETCore.Platforms"], "netcoreapp3.0": ["Microsoft.NETCore.Platforms"], "netcoreapp3.1": ["Microsoft.NETCore.Platforms"], "netstandard": [], "netstandard1.0": ["Microsoft.NETCore.Platforms"], "netstandard1.1": ["Microsoft.NETCore.Platforms"], "netstandard1.2": ["Microsoft.NETCore.Platforms"], "netstandard1.3": ["Microsoft.NETCore.Platforms"], "netstandard1.4": ["Microsoft.NETCore.Platforms"], "netstandard1.5": ["Microsoft.NETCore.Platforms"], "netstandard1.6": ["Microsoft.NETCore.Platforms"], "netstandard2.0": ["Microsoft.NETCore.Platforms"], "netstandard2.1": ["Microsoft.NETCore.Platforms"]}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "Newtonsoft.Json", "id": "Newtonsoft.Json", "version": "13.0.3", "sha512": "sha512-mbJSvHfRxfX3tR/U6n1WU+mWHXswYc+SB/hkOpx8yZZe68hNZGfymJu0cjsaJEkVzCMqePiU6LdIyogqfIn7kg==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": [], "net462": [], "net47": [], "net471": [], "net472": [], "net48": [], "net5.0": [], "net6.0": [], "net7.0": [], "net8.0": [], "netcoreapp1.0": ["NETStandard.Library"], "netcoreapp1.1": ["NETStandard.Library"], "netcoreapp2.0": [], "netcoreapp2.1": [], "netcoreapp2.2": [], "netcoreapp3.0": [], "netcoreapp3.1": [], "netstandard": [], "netstandard1.0": ["NETStandard.Library"], "netstandard1.1": ["NETStandard.Library"], "netstandard1.2": ["NETStandard.Library"], "netstandard1.3": ["NETStandard.Library"], "netstandard1.4": ["NETStandard.Library"], "netstandard1.5": ["NETStandard.Library"], "netstandard1.6": ["NETStandard.Library"], "netstandard2.0": [], "netstandard2.1": []}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "NUnit", "id": "NUnit", "version": "3.12.0", "sha512": "sha512-HAhwFxr+Z+PJf8hXzc747NecvsDwEZ+3X8SA5+GIRM43GAy1Ap+TQPMHsWCnisfes5vPZ1/a2md/91u+shoTsQ==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": [], "net462": [], "net47": [], "net471": [], "net472": [], "net48": [], "net5.0": ["NETStandard.Library"], "net6.0": ["NETStandard.Library"], "net7.0": ["NETStandard.Library"], "net8.0": ["NETStandard.Library"], "netcoreapp1.0": ["NETStandard.Library"], "netcoreapp1.1": ["NETStandard.Library"], "netcoreapp2.0": ["NETStandard.Library"], "netcoreapp2.1": ["NETStandard.Library"], "netcoreapp2.2": ["NETStandard.Library"], "netcoreapp3.0": ["NETStandard.Library"], "netcoreapp3.1": ["NETStandard.Library"], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": ["NETStandard.Library"], "netstandard1.5": ["NETStandard.Library"], "netstandard1.6": ["NETStandard.Library"], "netstandard2.0": ["NETStandard.Library"], "netstandard2.1": ["NETStandard.Library"]}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "NUnit3TestAdapter", "id": "NUnit3TestAdapter", "version": "4.6.0", "sha512": "sha512-Tkid6gicvzLgG3QQUAPq9koR4RpIiu+6UFU/hWr94pQKJlnQAXBVuKhqeqeSR9VXK+5BtJfOsO/nB06LnIYpSg==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": [], "net462": [], "net47": [], "net471": [], "net472": [], "net48": [], "net5.0": [], "net6.0": [], "net7.0": [], "net8.0": [], "netcoreapp1.0": [], "netcoreapp1.1": [], "netcoreapp2.0": [], "netcoreapp2.1": [], "netcoreapp2.2": [], "netcoreapp3.0": [], "netcoreapp3.1": [], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": [], "netstandard1.5": [], "netstandard1.6": [], "netstandard2.0": [], "netstandard2.1": []}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "Runfiles", "id": "Runfiles", "version": "0.14.0", "sha512": "sha512-xncDBZgH/5m3QXFXxTOSQiooXZrEhU9hPThejXvnCmFpGrXYKWq5xWzM3Lp8sL33pTWnuWySnrdIyu5W6DZDiQ==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": [], "net462": [], "net47": [], "net471": [], "net472": [], "net48": [], "net5.0": [], "net6.0": [], "net7.0": [], "net8.0": [], "netcoreapp1.0": [], "netcoreapp1.1": [], "netcoreapp2.0": [], "netcoreapp2.1": [], "netcoreapp2.2": [], "netcoreapp3.0": [], "netcoreapp3.1": [], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": [], "netstandard1.5": [], "netstandard1.6": [], "netstandard2.0": [], "netstandard2.1": []}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "System.Collections.Immutable", "id": "System.Collections.Immutable", "version": "9.0.0", "sha512": "sha512-z/Oo7nxWmZ0Y578vj8EUVrFJZ3DX6OMuUGlgeYgeeUZOFGT89XfaM8fDFMvJy6+mOIqW6ux5NdNzEnlTnQGJ7A==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": [], "net462": [], "net47": [], "net471": [], "net472": [], "net48": [], "net5.0": [], "net6.0": [], "net7.0": [], "net8.0": [], "netcoreapp1.0": [], "netcoreapp1.1": [], "netcoreapp2.0": [], "netcoreapp2.1": [], "netcoreapp2.2": [], "netcoreapp3.0": [], "netcoreapp3.1": [], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": [], "netstandard1.5": [], "netstandard1.6": [], "netstandard2.0": [], "netstandard2.1": []}, "targeting_pack_overrides": [], "framework_list": []},
            {"name": "System.Reflection.Metadata", "id": "System.Reflection.Metadata", "version": "9.0.0", "sha512": "sha512-jz+Y2m/CpdPvdjCNRigiWJYKFusdkfJlxDx4V5cWX2TubAMaz5CZpODBD/P2+20SpWvmZG6J3UYjl+R2Yg7yFw==", "sources": ["https://api.nuget.org/v3/index.json"], "dependencies": {"net11": [], "net20": [], "net30": [], "net35": [], "net40": [], "net403": [], "net45": [], "net451": [], "net452": [], "net46": [], "net461": ["System.Collections.Immutable"], "net462": ["System.Collections.Immutable"], "net47": ["System.Collections.Immutable"], "net471": ["System.Collections.Immutable"], "net472": ["System.Collections.Immutable"], "net48": ["System.Collections.Immutable"], "net5.0": ["System.Collections.Immutable"], "net6.0": ["System.Collections.Immutable"], "net7.0": ["System.Collections.Immutable"], "net8.0": ["System.Collections.Immutable"], "netcoreapp1.0": [], "netcoreapp1.1": [], "netcoreapp2.0": ["System.Collections.Immutable"], "netcoreapp2.1": ["System.Collections.Immutable"], "netcoreapp2.2": ["System.Collections.Immutable"], "netcoreapp3.0": ["System.Collections.Immutable"], "netcoreapp3.1": ["System.Collections.Immutable"], "netstandard": [], "netstandard1.0": [], "netstandard1.1": [], "netstandard1.2": [], "netstandard1.3": [], "netstandard1.4": [], "netstandard1.5": [], "netstandard1.6": [], "netstandard2.0": ["System.Collections.Immutable"], "netstandard2.1": ["System.Collections.Immutable"]}, "targeting_pack_overrides": [], "framework_list": []},
        ],
    )