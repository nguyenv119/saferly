# Saferly

Inspiration The inspiration behind Saferly came from a growing concern for the elderly population, many of whom live alone and face increasing risks from online scams. Nearly one-third of all seniors live independently, often without immediate family connections, and 82% of them report difficulties using new digital devices. Recognizing this vulnerability, our team set out to build a solution that could help protect seniors from digital threats, enabling them to connect with loved ones safely and confidently.

What It Does Saferly is a user-friendly app designed to help seniors navigate the internet securely. It provides essential tools such as email verification, website scanning, and a password manager, all aimed at reducing the risk of falling victim to scams. The app assigns a safety score to websites and emails, helping users quickly assess potential risks. Saferly also simplifies direct communication with trusted contacts, making it easier for seniors to stay connected with their family and friends.

How We Built It Our team used a combination of machine learning and cybersecurity techniques to build Saferly. The email verification and website scanning tools use advanced algorithms to detect phishing attempts and other malicious activities. We focused on a simple and accessible design, utilizing high-contrast colors, large buttons, and intuitive navigation to ensure ease of use. Data encryption and secure storage are implemented throughout to protect user information, making Saferly a reliable tool for seniors.

Challenges We Ran Into One of our biggest challenges was setting up the backend to securely connect to the Gmail API, allowing Saferly to access and analyze users' emails directly. This involved ensuring that our app could authenticate and securely handle email data while protecting user privacy. We needed to balance robust security protocols with a seamless connection to Gmail. Additionally, it required extensive testing to ensure that Saferly could retrieve emails reliably and provide real-time threat detection without compromising the user experience.

## Contributions
Long Nguyen: Backend, Frontend, Cloud, Crying<br>
Zachary Szeto: API Integration (Gmail, IP Address Verification, Email Verification, Password Generator) and Google Cloud Functions<br>
Eric Xiao: API Integration (Gmail, Url Verification) and Google Cloud Functions, Frontend
