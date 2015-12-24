set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5329, <2> 23.2064, <3> 23.4631, <4> 28.9798, <5> 19.9492, <6> 16.391, <7> 32.7509, <8> 30.0723, <9> 27.3673, <10> 23.7194, <11> 26.0186, <12> 16.9573, <13> 31.1753, <14> 19.7219, <15> 12.8014, <16> 8.5004, <17> 30.8792, <18> 33.4269, <19> 23.1102, <20> 25.7131;
param workload[JOB] := <1> 4.9531, <2> 4.8173, <3> 4.8439, <4> 5.3833, <5> 4.4665, <6> 4.0486, <7> 5.7228, <8> 5.4838, <9> 5.2314, <10> 4.8703, <11> 5.1008, <12> 4.1179, <13> 5.5835, <14> 4.4409, <15> 3.5779, <16> 2.9155, <17> 5.5569, <18> 5.7816, <19> 4.8073, <20> 5.0708;
param capacity[MACHINE] := <1> 10.3687, <2> 10.3687, <3> 10.3687, <4> 10.3687, <5> 10.3687, <6> 10.3687, <7> 10.3687;

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
