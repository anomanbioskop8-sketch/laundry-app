// import 'package:app_laundry/core/auth/permission/base_policy.dart';
// import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';

// class OrderPolicy implements BasePolicy<OrderEntity> {
//   final SessionCubit session;

//   OrderPolicy(this.session);

//   @override
//   bool can(Permission permission, OrderEntity order) {
//     switch (permission) {
//       case Permission.canDeleteOrder:
//         return order.status == OrderStatus.newOrder;

//       default:
//         return true;
//     }
//   }
// }
