set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.3194, <2> 26.439, <3> 14.9332, <4> 21.8337, <5> 22.7878, <6> 25.8486, <7> 23.3518, <8> 30.6793, <9> 28.5547, <10> 20.2469, <11> 20.7941, <12> 21.4766, <13> 29.4868, <14> 26.4528, <15> 22.3726, <16> 21.9029, <17> 31.8042, <18> 21.5753, <19> 18.1968, <20> 27.533;
param workload[JOB] := <1> 19.1007, <2> 3.9389, <3> 38.465, <4> 5.2664, <5> 40.8794, <6> 46.421, <7> 44.896, <8> 4.5125, <9> 2.9553, <10> 1.7016, <11> 45.9718, <12> 38.2744, <13> 11.8342, <14> 16.3651, <15> 3.9484, <16> 34.4127, <17> 37.1043, <18> 5.2526, <19> 42.8536, <20> 24.527;
param capacity[MACHINE] := <1> 58.5851, <2> 58.5851, <3> 58.5851, <4> 58.5851, <5> 58.5851, <6> 58.5851;

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
