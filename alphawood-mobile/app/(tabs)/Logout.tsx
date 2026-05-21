import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';
import { useRouter } from 'expo-router';

export default function Logout() {
    const router = useRouter();

    const handleLogout = () => {
        // clear auth state here later
        router.replace('/');
    };

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Logout</Text>
            <TouchableOpacity style={styles.button} onPress={handleLogout}>
                <Text style={styles.buttonText}>Log Out</Text>
            </TouchableOpacity>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#f9f9f9',
    },
    title: {
        fontSize: 32,
        fontWeight: '500',
        color: '#2D6A4F',
        marginBottom: 24,
    },
    button: {
        backgroundColor: '#2D6A4F',
        paddingHorizontal: 32,
        paddingVertical: 12,
        borderRadius: 8,
    },
    buttonText: {
        color: '#fff',
        fontSize: 16,
        fontWeight: '500',
    },
});