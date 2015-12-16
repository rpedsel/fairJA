set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.5186, <2> 21.1933, <3> 18.9508, <4> 21.321, <5> 25.2752, <6> 25.2035, <7> 19.387, <8> 23.82, <9> 29.2049, <10> 25.0384, <11> 31.718, <12> 32.7219, <13> 22.3847, <14> 25.6249, <15> 27.4376, <16> 11.4013, <17> 23.7308, <18> 24.3504, <19> 27.3864, <20> 21.0451;
param workload[JOB] := <1> 4.1855, <2> 4.6036, <3> 4.3533, <4> 4.6175, <5> 5.0274, <6> 5.0203, <7> 4.4031, <8> 4.8806, <9> 5.4042, <10> 5.0038, <11> 5.6319, <12> 5.7203, <13> 4.7312, <14> 5.0621, <15> 5.2381, <16> 3.3766, <17> 4.8714, <18> 4.9346, <19> 5.2332, <20> 4.5875;
param capacity[MACHINE] := <1> 12.1108, <2> 12.1108, <3> 12.1108, <4> 12.1108, <5> 12.1108, <6> 12.1108;

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
