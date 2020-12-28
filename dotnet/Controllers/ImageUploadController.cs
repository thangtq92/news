using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApi.Helpers;
using WebApi.Services;

namespace WebApi.Controllers
{
	[Authorize]
	[ApiController]
	[Route("[controller]")]
	public class ImageUploadController : ControllerBase
	{
		private IImageHandler _imageHandler;


		public ImageUploadController(IImageHandler imageHandler)
		{
			_imageHandler = imageHandler;
		}

		/// <summary>
		/// Uplaods an image to the server.
		/// </summary>
		/// <param name="file"></param>
		/// <returns></returns>
		/// 
		[HttpPost]
		public async Task<IActionResult> UploadImage(IFormFile file)
		{
			return Ok(await _imageHandler.UploadImage(file));
		}

		[HttpGet]
		public IActionResult GetImages()
		{
			var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\images");
			DirectoryInfo d = new DirectoryInfo(path);//Assuming Test is your Folder
			FileInfo[] Files = d.GetFiles("*.*"); //Getting Text files
			List<string> listImage = new List<string>();
			foreach (FileInfo fileInfo in Files)
			{
				listImage.Add(fileInfo.Name);
			}
			return Ok(listImage);
		}
	}
}
