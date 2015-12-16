set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.4439, <2> 27.15, <3> 26.0718, <4> 23.87, <5> 32.1271, <6> 31.8442, <7> 27.6849, <8> 29.3692, <9> 27.3317, <10> 19.0899, <11> 26.5541, <12> 27.637, <13> 24.6222, <14> 31.7648, <15> 33.325, <16> 28.6753, <17> 24.8771, <18> 14.0598, <19> 19.8504, <20> 25.1166;
param workload[JOB] := <1> 4.2946, <2> 5.2106, <3> 5.1061, <4> 4.8857, <5> 5.6681, <6> 5.6431, <7> 5.2616, <8> 5.4193, <9> 5.228, <10> 4.3692, <11> 5.1531, <12> 5.2571, <13> 4.9621, <14> 5.636, <15> 5.7728, <16> 5.3549, <17> 4.9877, <18> 3.7496, <19> 4.4554, <20> 5.0116;
param capacity[MACHINE] := <1> 101.4266, <2> 101.4266, <3> 101.4266, <4> 101.4266, <5> 101.4266, <6> 101.4266;

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
