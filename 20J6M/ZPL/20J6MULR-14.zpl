set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.5234, <2> 33.3983, <3> 35.8994, <4> 27.2264, <5> 1.4438, <6> 24.5612, <7> 49.2227, <8> 40.2377, <9> 17.2524, <10> 21.4074, <11> 13.7457, <12> 7.9436, <13> 22.0356, <14> 25.9705, <15> 43.1783, <16> 17.6622, <17> 37.5646, <18> 30.5195, <19> 31.6671, <20> 1.8462;
param workload[JOB] := <1> 27.6485, <2> 33.3166, <3> 29.7643, <4> 11.0866, <5> 35.6435, <6> 46.3759, <7> 28.6547, <8> 46.4417, <9> 5.0742, <10> 49.4967, <11> 24.0258, <12> 12.3157, <13> 24.0842, <14> 0.2446, <15> 34.5291, <16> 12.2393, <17> 25.011, <18> 10.3465, <19> 1.9906, <20> 35.057;
param capacity[MACHINE] := <1> 82.2244, <2> 82.2244, <3> 82.2244, <4> 82.2244, <5> 82.2244, <6> 82.2244;

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
