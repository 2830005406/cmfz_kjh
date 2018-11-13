import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class Testdf {
    @Autowired
    private AlbumService albumService;

    @Test
    public void test(){
        List<Album> all = albumService.findAll();
        for (Album album : all) {
            System.out.println(album);
        }
    }

    /*@Test
    public void test01(){
        new Album(1,"ds",new Date(),11)
    }*/
}
