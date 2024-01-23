#1 Here this command is used to create a directory named LAB2
mkdir LAB2
#2 and the task says we have to create six subdirectories so this command below helps to create it
cd LAB2
mkdir PLAIN ENC DEC KEYS SIGN HASH
#3 here, touch command is used to create file
cd PLAIN
touch plain.txt
#4 So,let's write some meaningful lines in the file that we created
echo "Will weld for beer" > plain.txt
#5  commands below are used to generate private and public keys inside sub-directory
cd
openssl genpkey -algorithm RSA -out ~/LAB2/KEYS/private_key.pem
openssl pkey -pubout -in ~/LAB2/KEYS/private_key.pem -out ~/LAB2/KEYS/public_key.pem

#6 here the commands are  used to encrypt files and save all them in ENC sub-directory
openssl rsautl -encrypt -pubin -inkey ~/LAB2/KEYS/public_key.pem -in ~/LAB2/PLAIN/plain.txt -out ~/LAB2/ENC/enc_public_data

#7
openssl rsautl -encrypt -inkey ~/LAB2/KEYS/private_key.pem -in ~/LAB2/PLAIN/plain.txt -out ~/LAB2/ENC/enc_private_data

#8
openssl dgst -sha256 -sign ~/LAB2/KEYS/private_key.pem -out ~/LAB2/SIGN/sign_private_data ~/LAB2/PLAIN/plain.txt

#9 In this part files are decrypted and saved all of them in DEC sub-directory
openssl rsautl -decrypt -inkey ~/LAB2/KEYS/private_key.pem -in ~/LAB2/ENC/enc_public_data -out ~/LAB2/DEC/dec_public_private.txt
openssl rsautl -decrypt -inkey ~/LAB2/KEYS/private_key.pem -in ~/LAB2/ENC/enc_private_data -out ~/LAB2/DEC/dec_private_private.txt
openssl rsautl -decrypt -pubin -inkey ~/LAB2/KEYS/public_key.pem -in ~/LAB2/ENC/enc_private_data -out ~/LAB2/DEC/dec_private_public.txt

#10 In this part the command helps us to create the hash file and save all of them in HASH sub-directory
md5sum ~/LAB2/PLAIN/plain.txt > ~/LAB2/HASH/plain_md5.txt
sha1sum ~/LAB2/PLAIN/plain.txt > ~/LAB2/HASH/plain_sha1.txt
openssl rmd160 ~/LAB2/PLAIN/plain.txt > ~/LAB2/HASH/plain_rmd160.txt

md5sum ~/LAB2/ENC/enc_public_data > ~/LAB2/HASH/enc_public_data_md5.txt
sha1sum ~/LAB2/ENC/enc_public_data > ~/LAB2/HASH/enc_public_data_sha1.txt

