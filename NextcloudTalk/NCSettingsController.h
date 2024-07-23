/**
 * SPDX-FileCopyrightText: 2020 Nextcloud GmbH and Nextcloud contributors
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ARDSettingsModel.h"

extern NSString * const kUserProfileDisplayName;
extern NSString * const kUserProfileDisplayNameScope;
extern NSString * const kUserProfileEmail;
extern NSString * const kUserProfileEmailScope;
extern NSString * const kUserProfilePhone;
extern NSString * const kUserProfilePhoneScope;
extern NSString * const kUserProfileAddress;
extern NSString * const kUserProfileAddressScope;
extern NSString * const kUserProfileWebsite;
extern NSString * const kUserProfileWebsiteScope;
extern NSString * const kUserProfileTwitter;
extern NSString * const kUserProfileTwitterScope;
extern NSString * const kUserProfileAvatarScope;

extern NSString * const kUserProfileScopePrivate;
extern NSString * const kUserProfileScopeLocal;
extern NSString * const kUserProfileScopeFederated;
extern NSString * const kUserProfileScopePublished;

extern NSString * const NCSettingsControllerDidChangeActiveAccountNotification;

typedef void (^UpdatedProfileCompletionBlock)(NSError *error);
typedef void (^LogoutCompletionBlock)(NSError *error);
typedef void (^GetCapabilitiesCompletionBlock)(NSError *error);
typedef void (^GetSignalingConfigCompletionBlock)(NSError *error);
typedef void (^SubscribeForPushNotificationsCompletionBlock)(BOOL success);

typedef NS_ENUM(NSInteger, NCPreferredFileSorting) {
    NCAlphabeticalSorting = 1,
    NCModificationDateSorting
};

@class NCExternalSignalingController;

@interface NCSettingsController : NSObject

@property (nonatomic, copy) ARDSettingsModel *videoSettingsModel;
@property (nonatomic, strong) UIAlertController *updateAlertController;
@property (nonatomic, strong) NSString *updateAlertControllerAccountId;
@property (nonatomic, strong) NSMutableDictionary *signalingConfigurations; // accountId -> signalingConfigutation
@property (nonatomic, strong) NSMutableDictionary *externalSignalingControllers; // accountId -> externalSignalingController

+ (instancetype)sharedInstance;
- (void)addNewAccountForUser:(NSString *)user withToken:(NSString *)token inServer:(NSString *)server;
- (void)setActiveAccountWithAccountId:(NSString *)accountId;
- (void)getUserProfileForAccountId:(NSString *)accountId withCompletionBlock:(UpdatedProfileCompletionBlock)block;
- (void)logoutAccountWithAccountId:(NSString *)accountId withCompletionBlock:(LogoutCompletionBlock)block;
- (void)getCapabilitiesForAccountId:(NSString *)accountId withCompletionBlock:(GetCapabilitiesCompletionBlock)block;
- (void)getSignalingConfigurationForAccountId:(NSString *)accountId withCompletionBlock:(GetSignalingConfigCompletionBlock)block;
- (void)setSignalingConfigurationForAccountId:(NSString *)accountId;
- (NCExternalSignalingController *)externalSignalingControllerForAccountId:(NSString *)accountId;
- (void)connectDisconnectedExternalSignalingControllers;
- (void)disconnectAllExternalSignalingControllers;
- (void)subscribeForPushNotificationsForAccountId:(NSString *)accountId withCompletionBlock:(SubscribeForPushNotificationsCompletionBlock)block;
- (NSInteger)chatMaxLengthConfigCapability;
- (BOOL)canCreateGroupAndPublicRooms;
- (BOOL)isGuestsAppEnabled;
- (BOOL)isReferenceApiSupported;
- (BOOL)isRecordingEnabled;
- (NCPreferredFileSorting)getPreferredFileSorting;
- (void)setPreferredFileSorting:(NCPreferredFileSorting)sorting;
- (BOOL)isContactSyncEnabled;
- (void)setContactSync:(BOOL)enabled;
- (BOOL)didReceiveCallsFromOldAccount;
- (void)setDidReceiveCallsFromOldAccount:(BOOL)receivedOldCalls;

@end
