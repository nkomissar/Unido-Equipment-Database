package org.unido.eetdb.admin.util;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.core.io.AbstractResource;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class CommonsMultipartFileResource extends AbstractResource 
{

		private final CommonsMultipartFile commonsMultipartFile;

		private final String description;

		private boolean read = false;


		/**
		 * Create a new CommonsMultipartFileResource.
		 * @param commonsMultipartFile the CommonsMultipartFile to use
		 */
		public CommonsMultipartFileResource(CommonsMultipartFile commonsMultipartFile) {
			this(commonsMultipartFile, "resource loaded through CommonsMultipartFile");
		}

		/**
		 * Create a new CommonsMultipartFileResource.
		 * @param commonsMultipartFile the CommonsMultipartFile to use
		 * @param description where the CommonsMultipartFile comes from
		 */
		public CommonsMultipartFileResource(CommonsMultipartFile commonsMultipartFile, String description) {
			if (commonsMultipartFile == null) {
				throw new IllegalArgumentException("CommonsMultipartFile must not be null");
			}
			this.commonsMultipartFile = commonsMultipartFile;
			this.description = (description != null ? description : "");
		}

		/**
		 * This implementation always returns {@code true}.
		 */
		@Override
		public boolean exists() {
			return true;
		}

		/**
		 * This implementation always returns {@code true}.
		 */
		@Override
		public boolean isOpen() {
			return true;
		}

		/**
		 * This implementation throws IllegalStateException if attempting to
		 * read the underlying stream multiple times.
		 */
		public InputStream getInputStream() throws IOException, IllegalStateException {
			if (this.read) {
				throw new IllegalStateException("InputStream has already been read - " +
						"do not use InputStreamResource if a stream needs to be read multiple times");
			}
			this.read = true;
			return this.commonsMultipartFile.getInputStream();
		}

		/**
		 * This implementation returns the name of the file.
		 * @see org.springframework.web.multipart.commons.CommonsMultipartFile#getOriginalFilename()
		 */
		@Override
		public String getFilename() 
		{
			return this.commonsMultipartFile.getOriginalFilename();
		}		
		/**
		 * This implementation returns the passed-in description, if any.
		 */
		public String getDescription() {
			return this.description;
		}

		/**
		 * This implementation returns the underlying File's length.
		 */
		@Override
		public long contentLength() throws IOException 
		{
			return this.commonsMultipartFile.getSize();
		}
		
		/**
		 * This implementation compares the underlying InputStream.
		 */
		@Override
		public boolean equals(Object obj) {
			return (obj == this ||
				(obj instanceof CommonsMultipartFileResource && ((CommonsMultipartFileResource) obj).commonsMultipartFile.equals(this.commonsMultipartFile)));
		}

		/**
		 * This implementation returns the hash code of the underlying InputStream.
		 */
		@Override
		public int hashCode() {
			return this.commonsMultipartFile.hashCode();
		}


}
