# About

This repository contains a list of security incidents that have been reported in the wild. The incidents are categorized by type and include information about the affected software, the CVEs, and the solution or mitigation steps. Tracking security incidents is important for security researchers, developers, and users to stay informed about the latest vulnerabilities and take necessary actions to protect their systems.

## 1. Universal Local Privilege Escalation ([#3](https://github.com/Tanvir1337x/nixos-config/issues/3))

### 1. CVEs

- CVE-2024-1086

### 1. Description

A use-after-free vulnerability in the Linux kernel's `netfilter: nf_tables` component can be exploited to achieve local privilege escalation. The `nft_verdict_init()` function allows positive values as drop error within the hook verdict, and hence the `nf_hook_slow()` function can cause a double free vulnerability when `NF_DROP` is issued with a drop error which resembles `NF_ACCEPT`.

### 1. Info

- **Type:** Privilege Escalation
- **Environment:** Local
- **Scope:** Universal
- **Affected Kernel:** v5.14 to v6.6
- **Success Rate:** 99.4% (KernelCTF images)

### 1. Solution/Mitigation

- Do not use any of the affected kernel versions.
- NIST NVD recommends upgrading past commit `f342de4e2f33e0e39165d8639387aa6c19dff660`.
- Ubuntu recommends:
  - If not needed, disable the ability for unprivileged users to create namespaces. To do this temporarily, run:

    ```sh
    sudo sysctl -w kernel.unprivileged_userns_clone=0
    ```

  - To disable across reboots, run:

    ```sh
    echo kernel.unprivileged_userns_clone=0 | sudo tee /etc/sysctl.d/99-disable-unpriv-userns.conf
    ```

### 1. References

1. [NVD CVE-2024-1086](https://nvd.nist.gov/vuln/detail/CVE-2024-1086)
2. [github.com/Notselwyn/CVE-2024-1086](https://github.com/Notselwyn/CVE-2024-1086)
3. [ubuntu.com/security/CVE-2024-1086](https://ubuntu.com/security/CVE-2024-1086)
4. [CVE Details for CVE-2024-1086](https://www.cvedetails.com/cve/CVE-2024-1086/)

## 2. Backdoor in Upstream xz/liblzma ([#4](https://github.com/Tanvir1337x/nixos-config/issues/4))

### 2. CVEs

- CVE-2024-3094

### 2. Description

Backdoor in upstream xz/liblzma leading to SSH server compromise.

### 2. Info

- **Type:** Backdoor
- **Affects:** xz-5.6.x
- **Scope:** OpenSSH having a linked libsystemd

### 2. Solution/Mitigation

- Do not use any of the affected versions of xz (`xz-5.6.x`).

### 2. References

1. [Tukaani xz Backdoor](https://tukaani.org/xz-backdoor/)
2. [OSS Security Mailing List](https://www.openwall.com/lists/oss-security/2024/03/29/4)
3. [NixOS Issue #300055](https://github.com/NixOS/nixpkgs/issues/300055)
4. [Hacker News Discussion](https://news.ycombinator.com/item?id=39865810)
5. [NVD CVE-2024-3094](https://nvd.nist.gov/vuln/detail/CVE-2024-3094)
6. [GitHub Advisory](https://github.com/advisories/GHSA-rxwq-x6h5-x525)
7. [NixOS Issue #300055 - Comment](https://github.com/NixOS/nixpkgs/issues/300055#issuecomment-2027690942)
8. [Gist by thesamesam](https://gist.github.com/thesamesam/223949d5a074ebc3dce9ee78baad9e27)

## 3. Nvidia 535.154.05 is Affected by Serious CVEs ([#6](https://github.com/Tanvir1337x/nixos-config/issues/6))

### 3. CVEs

- CVE‑2024‑0090
- CVE‑2024‑0091
- CVE‑2024‑0093
- CVE‑2024‑0092
- CVE‑2024‑0099
- CVE‑2024‑0084
- CVE‑2024‑0085
- CVE‑2024‑0094
- CVE‑2024‑0086

### 3. Description

Nvidia 535.154.05 is affected by serious CVEs.

### 3. Info

- **Type:** Vulnerability/Various
- **Affects:** Nvidia proprietary driver version 535.154.05
- **Scope:** Users of Nvidia proprietary driver version 535.154.05

### 3. Solution/Mitigation

- Do not use the affected version of the Nvidia proprietary driver. Instead, use the latest drivers with the CVE patches.

```nix
{
  config,
  lib,
  ...
}:
# Patches for critical vulnerabilities in the proprietary Nvidia Driver version 535.154
# <https://discourse.nixos.org/t/all-nividia-drivers-crash-or-do-not-work/47427/7>
let
  inherit (lib) mkIf mkForce;
in
  # This is the latest driver with the CVE patches + explicit sync
  mkIf (config.hardware.nvidia.package.version == "535.154") {
    hardware.nvidia = {
      package = mkForce config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "555.52.04";
        sha256_64bit = "sha256-nVOubb7zKulXhux9AruUTVBQwccFFuYGWrU1ZiakRAI=";
        sha256_aarch64 = "sha256-Kt60kTTO3mli66De2d1CAoE3wr0yUbBe7eqCIrYHcWk=";
        openSha256 = "sha256-wDimW8/rJlmwr1zQz8+b1uvxxxbOf3Bpk060lfLKuy0=";
        settingsSha256 = "sha256-PMh5efbSEq7iqEMBr2+VGQYkBG73TGUh6FuDHZhmwHk=";
        persistencedSha256 = "sha256-KAYIvPjUVilQQcD04h163MHmKcQrn2a8oaXujL2Bxro=";
      };
    };
  }
}
```

### 3. References

1. [NixOS Discourse 47427/7](https://discourse.nixos.org/t/all-nividia-drivers-crash-or-do-not-work/47427/7)
2. [NVD CVE-2024-0090](https://nvd.nist.gov/vuln/detail/CVE-2024-0090)
3. [NVD CVE-2024-0091](https://nvd.nist.gov/vuln/detail/CVE-2024-0091)
4. [NVD CVE-2024-0093](https://nvd.nist.gov/vuln/detail/CVE-2024-0093)
5. [NVD CVE-2024-0092](https://nvd.nist.gov/vuln/detail/CVE-2024-0092)
6. [NVD CVE-2024-0099](https://nvd.nist.gov/vuln/detail/CVE-2024-0099)
7. [NVD CVE-2024-0084](https://nvd.nist.gov/vuln/detail/CVE-2024-0084)
8. [NVD CVE-2024-0085](https://nvd.nist.gov/vuln/detail/CVE-2024-0085)
9. [NVD CVE-2024-0094](https://nvd.nist.gov/vuln/detail/CVE-2024-0094)
10. [NVD CVE-2024-0086](https://nvd.nist.gov/vuln/detail/CVE-2024-0086)

## 4. Remote Unauthenticated Code Execution Vulnerability in OpenSSH Server ([#7](https://github.com/Tanvir1337x/nixos-config/issues/7))

## 4. CVEs

- CVE-2024-6387

## 4. Description

A critical vulnerability in sshd(8) was present in portable OpenSSH versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary code execution with root privileges.

OpenBSD systems are unaffected by this bug, as OpenBSD developed a secure mechanism in 2001 that prevents this vulnerability.

## 4. Info

Name: regreSSHion
Type: Remote Unauthenticated Code Execution Vulnerability
Scope: OpenSSH’s server (sshd) in glibc-based linux systems
Affects:

- OpenSSH versions earlier than 4.4p1 are vulnerable to this signal handler race condition unless they are patched for CVE-2006-5051 and CVE-2008-4109.

- Versions from 4.4p1 up to, but not including, 8.5p1 are not vulnerable due to a transformative patch for CVE-2006-5051, which made a previously unsafe function secure.

- The vulnerability resurfaces in versions from 8.5p1 up to, but not including, 9.8p1 due to the accidental removal of a critical component in a function.

## 4. Solution/Mitigation

Check any exposed Linux glibc systems running OpenSSH and patch them if they are vulnerable.

[Temporary solution on nixos based systems as suggested by Qualys](https://github.com/nix-community/srvos/pull/449). Basically set this to your nixos config and redeploy & restart ssh service:

```nix
services.openssh.settings.LoginGraceTime = 0;
```

Note: It makes you vulnerable to a denial of service attack.

### 4. References

1. [NixOS is affected by CVE-2024-6387](https://discourse.nixos.org/t/security-advisory-openssh-cve-2024-6387-regresshion-update-your-servers-asap/48220)
2. [oss-security mailing list](https://www.openwall.com/lists/oss-security/2024/07/01/3)
3. [Qualys Blog Post](https://blog.qualys.com/vulnerabilities-threat-research/2024/07/01/regresshion-remote-unauthenticated-code-execution-vulnerability-in-openssh-server)
4. [Reddit MSP Discussion](https://www.reddit.com/r/msp/comments/1dsse9e/security_awareness_openssh_cve20246387_rce/)
5. [CVE-2024-6387 Check](https://github.com/xaitax/CVE-2024-6387_Check)
6. [Recorded Future CVE Database](https://www.recordedfuture.com/vulnerability-database/CVE-2024-6387)
7. [Debian Security Tracker](https://security-tracker.debian.org/tracker/CVE-2024-6387)

## 5. Critical Use-After-Free Vulnerability in Firefox and Thunderbird ([#16](https://github.com/Tanvir1337x/nixos-config/issues/16))

### 5. CVEs

- CVE-2024-9680

### 5. Description

CVE-2024-9680 is a critical vulnerability affecting Firefox and Thunderbird. An attacker can achieve code execution in the content process by exploiting a use-after-free in Animation timelines. Reports indicate this vulnerability has been actively exploited in the wild.

### 5. Info

- **Type:** Use-After-Free
- **Affected Products:**
  - Firefox < 131.0.2
  - Firefox ESR < 128.3.1
  - Firefox ESR < 115.16.1
  - Thunderbird < 131.0.1
  - Thunderbird < 128.3.1
  - Thunderbird < 115.16.0

### 5. Solution/Mitigation

Upgrade to the following versions to mitigate the vulnerability:

- Firefox >=131.0.2
- Firefox >=ESR 128.3.1
- Firefox >=ESR 115.16.1

### 5. References

1. [nvd.nist.gov/vuln/detail/CVE-2024-9680](https://nvd.nist.gov/vuln/detail/CVE-2024-9680)
2. [Bug 1923344](https://bugzilla.mozilla.org/show_bug.cgi?id=1923344)
3. [Mozilla Security Advisory MFSA2024-51](https://www.mozilla.org/security/advisories/mfsa2024-51/)
4. [Mozilla Security Advisory MFSA2024-52](https://www.mozilla.org/security/advisories/mfsa2024-52/)
5. [Security Vulnerability - CVE-2024-9680, fixed in Firefox 131.0.2, Firefox ESR 128.3.1, Firefox ESR 115.16.1](https://www.mozilla.org/en-US/security/advisories/mfsa2024-51/)
