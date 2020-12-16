using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Dynamic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace WebApi.Helpers.Extension
{
    public class FieldPrivateAttributeAPP : Attribute
    {
        private bool value = false;

        /// <summary>
        /// Initializes a new instance of the <see cref="FieldPrivateAttributeAPP"/> class.
        /// </summary>
        /// <param name="isPrivate">if set to <c>true</c> [is private].</param>
        public FieldPrivateAttributeAPP(bool isPrivate)
        {
            value = isPrivate;
        }

        /// <summary>
        /// Gets a value indicating whether this instance is private.
        /// </summary>
        /// <value>
        ///   <c>true</c> if this instance is private; otherwise, <c>false</c>.
        /// </value>
        public bool isPrivate
        {
            get
            {
                return value;
            }
        }
    }
    public static class ExtensionCommon
    {
        private static RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
        private static Random random = new Random(DateTime.Now.Millisecond);

        /// <summary>
        /// Tính toán thời độ chính xác 100.00 %
        /// </summary>
        /// <param name="totalQuestion"></param>
        /// <param name="totalCorrect"></param>
        /// <returns></returns>
        public static double analyzeAccuracy(long totalQuestion, long totalCorrect)
        {
            double _return = 0;
            if (totalCorrect > 0 && totalQuestion > 0)
            {
                _return = (double)(totalCorrect * 100) / totalQuestion;
            }
            return _return;
        }

        /// <summary>
        /// tính toán phần trăm hoàn thành
        /// </summary>
        /// <param name="scoresNow"></param>
        /// <param name="scoresRequire"></param>
        /// <returns></returns>
        public static long analyzeProcessComplete(float? scoresNow, long scoresRequire)
        {
            long _return = 0;
            float? res = (scoresNow > 0 && scoresRequire > 0) ? (scoresNow * 100) / scoresRequire : 0;
            _return = res > 100 ? 100 : (long)(res + 0);
            return _return;
        }

        /// <summary>
        /// To the score.
        /// </summary>
        /// <param name="scores">The scores.</param>
        /// <returns></returns>
        public static float ToScore(double scores)
        {
            float _return = (float)Math.Round(scores, 2, MidpointRounding.AwayFromZero);
            return _return;
        }

        /// <summary>
        /// Analyzes the scores.
        /// </summary>
        /// <param name="rightAnswer">if set to <c>true</c> [right answer].</param>
        /// <param name="countQuestionRepeat">The count question repeat.</param>
        /// <param name="speedProblem">The speed problem.</param>
        /// <returns></returns>
        public static double analyzeScores(bool rightAnswer, long countQuestionRepeat, double speedProblem)
        {
            double _return = 0;
            const double bias = 10;
            countQuestionRepeat = countQuestionRepeat < 2 ? 1 : countQuestionRepeat;
            if (rightAnswer)
            {
                _return = (bias / countQuestionRepeat) - speedProblem;
            }
            else
            {
                _return = speedProblem > 0.1 ? 0.001 : speedProblem;
            }
            return _return;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="maxPoint"></param>
        /// <param name="totalCorrect"></param>
        /// <param name="totalQuestion"></param>
        /// <returns></returns>
        public static float AnalyzeScore(int maxPoint, long totalCorrect, long totalQuestion)
        {
            float scoreQuestion = (float)maxPoint / totalQuestion;
            float score = ToScore(scoreQuestion * totalCorrect);
            return score;
        }

        /// <summary>
        /// Tính tốc đọ
        /// </summary>
        /// <param name="totalQuestion"></param>
        /// <param name="timePractice"></param>
        /// <returns></returns>
        public static double analyzeSpeed(long totalQuestion, long timePractice)
        {
            double _return = 0;
            if (totalQuestion > 0 && timePractice > 0)
            {
                _return = (double)totalQuestion / timePractice;
            }
            return _return;
        }

        /// <summary>
        /// Gets the score next block.
        /// </summary>
        /// <param name="scoreNow"><see cref="ColProblemStudent.scoresNow"/> : Điểm hiện tại của bài luyện </param>
        /// <param name="scorePass"><see cref="ColProblem.GetScorePassBlock(int)"/> : Điêm số để vượt qua khối</param>
        /// <param name="scoreSystem">Điểm số hệ thống còn lại để cộng</param>
        /// <returns></returns>
        public static int GetScoreNextBlock(float scoreNow, int scorePass, int scoreSystem)
        {
            int _return = 1;
            //Điểm số cần để qua khổi khối
            float scoresNeed = scorePass - scoreNow;
            //Điểm số còn còn lại
            int scoresSelect = scoreSystem - _return;
            //Điểm số có thể có khi user làm đúng câu hỏi
            var scoresNowNext = scoreNow + scoresSelect;
            if (scoresNowNext < scorePass)
            {
                //Tính lại điểm của câu hỏi nếu làm đúng
                if (scoresSelect > 0 && scoresNeed > 0)
                {
                    if (scoresSelect > scoresNeed)
                    {
                        return 1;
                    }
                    else
                    {
                        float scoresStep = scoresNeed / scoresSelect;
                        int scoresStepInt = (int)scoresStep;
                        _return = (scoresStep > scoresStepInt) ? scoresStepInt + 1 : scoresStepInt;
                    }
                }
                else
                {
                    //Hệ thống không còn điểm
                    _return = scorePass;
                }
            }
            return _return;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="base64EncodedData"></param>
        /// <returns></returns>
        public static string Base64Decode(string base64EncodedData)
        {
            byte[] base64EncodedBytes = Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="plainText"></param>
        /// <returns></returns>
        public static string Base64Encode(string plainText)
        {
            byte[] plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(plainTextBytes);
        }

        /// <summary>
        /// Converts the object to string parameter URL.
        /// </summary>
        /// <param name="paramsObject">The parameters object.</param>
        /// <returns></returns>
        public static string convertObjectToStringParamUrl(Object paramsObject)
        {
            if (paramsObject != null)
            {

                var data = from p in paramsObject.GetType().GetProperties()
                           where p.GetValue(paramsObject, null) != null
                           select new
                           {
                               p.Name,
                               Value = p.GetValue(paramsObject, null).ToString()
                           };
                IEnumerable<string> properties = from p in data
                                                 where !string.IsNullOrWhiteSpace(p.Value)
                                                 select $"{p.Name}={HttpUtility.UrlEncode(p.Value)}";

                string queryString = String.Join("&", properties.ToArray());
                return queryString;
            }
            return "";
        }

        /// <summary>
        /// Adds the parameter URL.
        /// </summary>
        /// <param name="url">The URL.</param>
        /// <param name="paramsObject">The parameters object.</param>
        /// <returns></returns>
        public static string AddParamUrl(string url, Object paramsObject)
        {
            UriBuilder urlB = new UriBuilder(HttpUtility.UrlDecode(url));
            NameValueCollection q = HttpUtility.ParseQueryString(urlB.Query);
            if (paramsObject != null)
            {
                foreach (PropertyInfo p in paramsObject.GetType().GetProperties().Where(p => p.GetValue(paramsObject, null) != null))
                {
                    q[p.Name] = HttpUtility.UrlEncode(p.GetValue(paramsObject, null).ToString());
                }
            }
            urlB.Query = q.ToString();
            return urlB.ToString();
        }

        /// <summary>
        /// Creates the m d5.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <returns></returns>
        public static string CreateMD5(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
            {
                return "";
            }
            // Use input string to calculate MD5 hash
            using (MD5 md5 = MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);
                // Convert the byte array to hexadecimal string
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString();
            }
        }

        /// <summary>
        /// Fixes me up.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="fixMe">The fix me.</param>
        /// <returns></returns>
        public static object FixMeUp<T>(this T fixMe)
        {
            Type t = fixMe.GetType();
            IDictionary<string, object> returnClass = new ExpandoObject() as IDictionary<string, object>;
            foreach (PropertyInfo pr in t.GetProperties())
            {
                object val = pr.GetValue(fixMe);
                if (val is string && string.IsNullOrWhiteSpace(val.ToString()))
                {
                }
                else if (val == null)
                {
                }
                else
                {
                    returnClass.Add(pr.Name, val);
                }
            }
            return returnClass;
        }

        /// <summary>
        /// Gets the description property.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="valueRoleType">Type of the value role.</param>
        /// <returns></returns>
        public static string GetDescriptionProperty<T>(string valueRoleType)
        {
            if (!string.IsNullOrWhiteSpace(valueRoleType))
            {
                FieldInfo[] data = typeof(T).GetFields();
                foreach (FieldInfo field in data)
                {
                    if (field.Name.ToUpper() == valueRoleType.ToUpper())
                    {
                        DescriptionAttribute[] attributes = (DescriptionAttribute[])field.GetCustomAttributes(typeof(DescriptionAttribute), false);
                        if (attributes != null && attributes.Length > 0)
                        {
                            return attributes[0].Description;
                        }
                        else
                        {
                            return valueRoleType.ToString();
                        }
                    }
                }
                return valueRoleType;
            }
            return null;
        }


        /// <summary>
        /// lấy thời gian duy tri dang nhap
        /// </summary>
        /// <param name="rememberMe"></param>
        /// <returns></returns>
        public static int GetExpireMinute(bool? rememberMe)
        {
            return rememberMe == true ? (int)TimeSpan.FromHours(24).TotalMinutes : (int)TimeSpan.FromHours(12).TotalMinutes;
        }

        /// <summary>
        ///
        /// </summary>
        /// <returns></returns>
        public static string GetIPServer()
        {
            string _return = Dns.GetHostName();
            try
            {
                using (WebClient client = new WebClient())
                {
                    _return = client.DownloadString("https://ipinfo.io/ip");
                }
                if (!string.IsNullOrWhiteSpace(_return))
                {
                    _return = _return.Trim();
                }
            }
            catch { }
            return _return;
        }

        /// <summary>
        /// Gets the type of the value role.
        /// </summary>
        /// <returns></returns>
        public static List<string> GetNameProperty<T>()
        {
            List<string> _return = new List<string>();
            FieldInfo[] data = typeof(T).GetFields();
            foreach (FieldInfo field in data)
            {
                FieldPrivateAttributeAPP[] attributes = (FieldPrivateAttributeAPP[])field.GetCustomAttributes(typeof(FieldPrivateAttributeAPP), false);
                if (attributes != null && attributes.Length == 0)
                {
                    _return.Add(field.Name.ToUpper());
                }
                else if (attributes != null && attributes.Length > 0)
                {
                    if (!attributes[0].isPrivate)
                    {
                        _return.Add(field.Name.ToUpper());
                    }
                }
            }
            return _return.OrderBy(x => x).ToList(); ;
        }

        /// <summary>
        /// MD5s the specified input.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <returns></returns>
        public static string md5(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
            {
                return "";
            }
            // Use input string to calculate MD5 hash
            using (MD5 md5 = MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);
                // Convert the byte array to hexadecimal string
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString().ToLower();
            }
        }
        /// <summary>
        /// Sha256s the specified text.
        /// </summary>
        /// <param name="text">The text.</param>
        /// <returns></returns>
        public static string sha256(string text)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(text);
            SHA256Managed hashstring = new SHA256Managed();
            byte[] hash = hashstring.ComputeHash(bytes);
            string hashString = string.Empty;
            foreach (byte x in hash)
            {
                hashString += String.Format("{0:x2}", x);
            }
            return hashString;
        }

        /// <summary>
        /// Đảo phần tử trong mảng
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        public static void Shuffle<T>(this IList<T> list)
        {
            if (list != null && list.Count > 1)
            {
                int maxRandom = list.Count;
                for (var n = list.Count - 1; n > 0; n--)
                {
                    int k = random.Next(maxRandom);
                    if (k != n)
                    {
                        T value = list[k];
                        list[k] = list[n];
                        list[n] = value;
                    }
                }
            }
        }

        /// <summary>
        /// To the float four digit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float toFloatFourDigit(this double value)
        {
            return (float)Math.Round(value, 4, MidpointRounding.AwayFromZero);
        }

        /// <summary>
        /// To the float four digit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float toFloatFourDigit(this float value)
        {
            return (float)Math.Round(value, 4, MidpointRounding.AwayFromZero);
        }

        /// <summary>
        /// To the float six digit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float toFloatSixDigit(this double value)
        {
            return (float)Math.Round(value, 6, MidpointRounding.AwayFromZero);
        }

        /// <summary>
        /// To the float six digit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float toFloatSixDigit(this float value)
        {
            return (float)Math.Round(value, 6, MidpointRounding.AwayFromZero);
        }

        /// <summary>
        /// To the float two digit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float toFloatTwoDigit(this double value)
        {
            return (float)Math.Round(value, 2, MidpointRounding.AwayFromZero);
        }

        /// <summary>
        /// Converts to floattwodigit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float ToFloatTwoDigit(this double value)
        {
            int A = (int)Math.Floor(value);
            var temp = value - A;
            int B;
            if (temp > 0.75)
            {
                B = 0;
                A = A + 1;
            }
            else if (temp > 0.5)
            {
                B = 75;
            }
            else if (temp > 0.25)
            {
                B = 50;
            }
            else if (temp >= 0.1)
            {
                B = 25;
            }
            else
            {
                B = 0;
            }
            return float.Parse($"{A}.{B}");
        }

        /// <summary>
        /// To the float two digit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float toFloatTwoDigit(this float value)
        {
            return (float)Math.Round(value, 2, MidpointRounding.AwayFromZero);
        }

        /// <summary>
        /// To the float zero digit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float toFloatZeroDigit(this double value)
        {
            return (float)Math.Round(value, 0, MidpointRounding.AwayFromZero);
        }

        /// <summary>
        /// To the float zero digit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float toFloatZeroDigit(this float value)
        {
            return (float)Math.Round(value, 0, MidpointRounding.AwayFromZero);
        }

        /// <summary>
        /// To the float zero digit.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static float toFloat(this string value,int digit)
        {
            return (float)Math.Round(decimal.Parse(value, CultureInfo.InvariantCulture.NumberFormat), digit, MidpointRounding.AwayFromZero);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="strS"></param>
        /// <param name="strD"></param>
        /// <returns></returns>
        private static bool CompareString(string strS, string strD)
        {
            if (string.IsNullOrWhiteSpace(strD) || string.IsNullOrWhiteSpace(strS))
            {
                return false;
            }
            //chuẩn hóa string
            strS = strS.ToUpper().Trim();
            strD = strD.ToUpper().Trim();
            return strS == strD;
        }

        /// <summary>
        /// Converts the string representation of a number to an integer.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static int ToInt(this double value)
        {
            return (int)value;
        }

        /// <summary>
        /// Converts the string representation of a number to an integer.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static int ToInt(this string value)
        {
            var result = 0;
            if (!string.IsNullOrWhiteSpace(value)) { int.TryParse(value,out result);}
            return result;
        }

        public static byte ToByte(this string value)
        {
            byte result = 0;
            if (!string.IsNullOrWhiteSpace(value)) { byte.TryParse(value, out result); }
            return result;
        }

        public static byte? ToByteOrNull(this string value)
        {
            if (!string.IsNullOrWhiteSpace(value))
            {
                byte result = 0;
                if (!string.IsNullOrWhiteSpace(value)) { byte.TryParse(value, out result); }
                return result;
            }
            
            return null;
        }

        /// <summary>
        /// To the long.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        /// <autogeneratedoc />
        /// TODO Edit XML Comment Template for ToLong
        public static long ToLong(this double value)
        {
            return (long)value;
        }

        /// <summary>
        /// To the boolean.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        /// <autogeneratedoc />
        /// TODO Edit XML Comment Template for boolean
        public static bool? ToBool(this string value)
        {
            var result = false;
            if (!string.IsNullOrWhiteSpace(value))
            {
                bool.TryParse(value, out result);
            }
            return result;

        }

        /// <summary>
        /// To the boolean.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        /// <autogeneratedoc />
        /// TODO Edit XML Comment Template for boolean
        public static bool? ToBoolOrNull(this string value)
        {
            if (!string.IsNullOrWhiteSpace(value))
            {
                var result = false;
                bool.TryParse(value, out result);
                return result;
            }
            return null;
        }

        /// <summary>
        /// Gets the name of the environment.
        /// </summary>
        /// <returns></returns>
        public static string GetEnvironmentName()
        {
            var environmentName = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
            if (Environments.Production == environmentName || string.IsNullOrWhiteSpace(environmentName))
            {
                environmentName = "prod";
            }
            return environmentName;
        }
        /// <summary>
        /// Determines whether this instance is production.
        /// </summary>
        /// <returns>
        ///   <c>true</c> if this instance is production; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsProduction()
        {
            return GetEnvironmentName() == "prod";
        }

        /// <summary>
        /// Gets the HTML logo.
        /// </summary>
        /// <returns></returns>
        public static string GetHtmlLogo()
        {

            var environmentName = GetEnvironmentName();
            switch (environmentName)
            {
                case "development":
                case "Development":
                    environmentName = "Dev";
                    break;

                case "prod":
                    environmentName = "";
                    break;
            }
            if (environmentName != "")
            {
                var _return = "<div style = \" position: fixed; width: 0; opacity: 0.8; z-index: 9000; height: 0; border-top: 50px solid #d9534f; border-right: 50px solid transparent; \" >"
              + "<span style=\"z-index: 99999;font-size: 12px; position: absolute; top: -42px; left: 1px; transform: rotate(-45deg); color: #eaeaea;\" >" + environmentName + "</span></div>";
                return _return;
            }
            return "";
        }

        /// <summary>
        /// Generates the configuration.
        /// </summary>
        /// <param name="n">The n.</param>
        /// <returns></returns>
        public static List<string> GenerateConfig(int n)
        {
            if (n < 10)
            {
                int[] a = new int[100];
                for (int i = 1; i <= n; i++) a[i] = i;
                int ok = 1;
                var listUser = new List<string>();
                while (ok == 1)
                {
                    int i = n - 1;
                    var key = "";
                    for (int j = 1; j <= n; j++)
                    {
                        key = $"{key}{a[j]}";
                    }
                    listUser.Add(key);
                    while (i > 0 && a[i] > a[i + 1]) i--;
                    if (i > 0)
                    {
                        int k = n;
                        while (a[i] > a[k]) k--;
                        int t = a[i]; a[i] = a[k]; a[k] = t;
                        int r = i + 1, s = n;
                        while (r <= s)
                        {
                            int tg = a[r]; a[r] = a[s]; a[s] = tg;
                            r++;
                            s--;
                        }
                    }
                    else ok = 0;
                }
                return listUser;
            }
            return new List<string>();
        }

        /// <summary>
        /// Differents the combinations.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="elements">The elements.</param>
        /// <param name="k">The k.</param>
        /// <returns></returns>
        public static IEnumerable<IEnumerable<T>> DifferentCombinations<T>(this IEnumerable<T> elements, int k)
        {

            return k == 0 ? new[] { new T[0] } :
              elements.SelectMany((e, i) =>
                elements.Skip(i + 1).DifferentCombinations(k - 1).Select(c => (new[] { e }).Concat(c)));
        }

        public static string ToRoman(int number)
        {
            if ((number < 0) || (number > 3999)) throw new ArgumentOutOfRangeException("insert value betwheen 1 and 3999");
            if (number < 1) return string.Empty;
            if (number >= 1000) return "M" + ToRoman(number - 1000);
            if (number >= 900) return "CM" + ToRoman(number - 900);
            if (number >= 500) return "D" + ToRoman(number - 500);
            if (number >= 400) return "CD" + ToRoman(number - 400);
            if (number >= 100) return "C" + ToRoman(number - 100);
            if (number >= 90) return "XC" + ToRoman(number - 90);
            if (number >= 50) return "L" + ToRoman(number - 50);
            if (number >= 40) return "XL" + ToRoman(number - 40);
            if (number >= 10) return "X" + ToRoman(number - 10);
            if (number >= 9) return "IX" + ToRoman(number - 9);
            if (number >= 5) return "V" + ToRoman(number - 5);
            if (number >= 4) return "IV" + ToRoman(number - 4);
            if (number >= 1) return "I" + ToRoman(number - 1);
            throw new ArgumentOutOfRangeException("something bad happened");
        }

        /// <summary>
        /// Shuffle string
        /// </summary>
        /// <param name="values"></param>
        /// <returns></returns>
        public static string Shuffle(string values,int length=0)
        {
            values = values.Trim();

            string rs = string.Empty;
           
            //Convert string to array string
                string[] arr = new string[values.Length];
                for (int i = 0; i < values.Length; i++) arr[i] = char.ToString(values[i]);

                #region Random character in string input

                var random = new System.Random();
                var list = new List<KeyValuePair<int, string>>();

                // Add all strings from array
                // Add new random int each time with value from array string
                foreach (string s in arr)
                {
                    list.Add(new KeyValuePair<int, string>(random.Next(), s));
                }

                // Sort the list by the random number
                var sorted = from item in list orderby item.Key select item;
                //Key : value order
                //Value character in valueRan input

                // Allocate new string array
                string[] shuffle = new string[arr.Length];

                // Copy values to array
                int index = 0;
                foreach (KeyValuePair<int, string> pair in sorted)
                {
                    shuffle[index] = pair.Value;
                    index++;
                }

                #endregion

                // Return copied array

                #region Convert array string to string charater
                if (shuffle.Length > 0)
                {
                    for (int i = 0; i < shuffle.Length; i++) rs += shuffle[i];
                    rs = rs.Trim();  //488ead9b6719a8oet00bc0b479df762f9n8t888868318c5057a9aed8d
                }
                #endregion

            
                if(length > 0)
            {
                return rs.Substring(0, length);
            }

            return rs;
        }
    }
}