#ifndef _ESP32_VGMPLAY_H_
#define _ESP32_VGMPLAY_H_

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Function sets frequency for output sample data
 * @param frequency frequency in HZ
 * @return 0 if no error
 * @note function should be used before vgm_play_start().
 */
int vgm_set_format(uint32_t frequency);

/**
 * Function sets volume for the generated output sample data
 * 1.0f means normal value, corresponding to volume in original vgm file
 * Please, note that many vgm files produce low level volume audio.
 * @param volume volume for generated audio [0.0 - 4.0]. Higher values are
 *        not recommended
 * @return 0 if no error
 * @note function should be used before vgm_play_start()
 */
int vgm_set_volume(float volume);

/**
 * Function initializes emulator with specific settings
 * @param data pointer to raw data, containing content to play
 * @param size size of data in buffer
 * @return 0 if no error, or 1 if failed to read vgm data from buffer
 */
int vgm_play_start(const uint8_t *data, int size);

/**
 * Function decodes vgm buffer (passed via vgm_play_start), prepares
 * PCM 16-bit data in stereo mode and fills specified outBuffer.
 * These decoded data can be used to generate audio for I2S interface.
 * Call this function multiple times to decode all data
 * @param outBuffer buffer to fill with PCM data
 * @param size maximum size of specified buffer
 * @return size in bytes of decoded samples, or 0 if end of vgm file
 *         is reached.
 */
int vgm_play_data(void *outBuffer, int size);

/**
 * Stops emulator and frees all internal buffers
 */
int vgm_play_stop(void);



#ifdef __cplusplus
}
#endif

#endif
