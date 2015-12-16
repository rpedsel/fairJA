set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0363, <2> 45.7317, <3> 16.6996, <4> 38.52, <5> 24.7606, <6> 35.7399, <7> 34.1437, <8> 45.3727, <9> 1.1135, <10> 49.0994, <11> 28.229, <12> 33.3652, <13> 20.0265, <14> 15.7026, <15> 9.894, <16> 4.9198, <17> 26.1591, <18> 27.4744, <19> 45.8162, <20> 7.0908;
param workload[JOB] := <1> 5.3885, <2> 6.7625, <3> 4.0865, <4> 6.2064, <5> 4.976, <6> 5.9783, <7> 5.8433, <8> 6.7359, <9> 1.0552, <10> 7.0071, <11> 5.3131, <12> 5.7763, <13> 4.4751, <14> 3.9627, <15> 3.1455, <16> 2.2181, <17> 5.1146, <18> 5.2416, <19> 6.7688, <20> 2.6629;
param capacity[MACHINE] := <1> 12.3398, <2> 12.3398, <3> 12.3398, <4> 12.3398, <5> 12.3398, <6> 12.3398;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
